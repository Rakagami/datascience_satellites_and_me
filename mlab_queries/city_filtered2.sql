-- 5 additional cities picked based on latitudes/longitudes extremes and amount of probes
WITH filtered_data as (
  SELECT 
    *
  FROM 
    `measurement-lab.ndt.ndt7`
  WHERE 
    date > DATE("2019-01-01") AND
    date < DATE("2023-05-01") AND
    client.Network.ASNumber = 14593 AND
    (
      a.MinRTT > 0.0 AND
      a.MeanThroughputMbps > 0.0 AND
      a.lossrate >= 0.0
    ) AND (
    (client.Geo.City = "Chicago") OR
    (client.Geo.City = "Denver") OR
    (client.Geo.City = "Toronto") OR
    (client.Geo.City = "Calgary") OR
    (client.Geo.City = "Berlin")
    )
    AND TIMESTAMP_DIFF(raw.EndTime, raw.StartTime, SECOND) >= 8
    AND (ARRAY_LENGTH(raw.Download.ServerMeasurements) > 5 OR ARRAY_LENGTH(raw.Upload.ServerMeasurements) > 5)
),
value_data as (
  SELECT 
  id,
  date,
  CASE WHEN ARRAY_LENGTH(raw.Download.ServerMeasurements) >= 1 THEN True else False END isDownload,

  server.Site as server_Site,
  server.Geo.CountryCode as server_Geo_CountryCode,
  server.Geo.CountryName as server_Geo_CountryName,
  server.Geo.City as server_Geo_City,
  server.Geo.Latitude as server_Geo_Latitude,
  server.Geo.Longitude as server_Geo_Longitude,
  server.Network.CIDR as server_Network_CIDR,
  server.Network.ASNumber as server_Network_ASNumber,
  server.Network.ASName as server_Network_ASName,

  client.Geo.ContinentCode as client_Geo_ContinentCode,
  client.Geo.CountryCode as client_Geo_CountryCode,
  client.Geo.CountryName as client_Geo_CountryName,
  client.Geo.City as client_Geo_City,
  client.Geo.Latitude as client_Geo_Latitude,
  client.Geo.Longitude as client_Geo_Longitude,
  client.Geo.AccuracyRadiusKm as client_Geo_AccuracyRadiusKm,
  client.Network.CIDR as client_Network_CIDR,

  raw.ServerIP as raw_ServerIP,
  raw.ServerPort as raw_ServerPort,
  raw.ClientIP as raw_ClientIP,
  raw.ClientPort as raw_ClientPort,

  a.TestTime as a_TestTime,
  a.CongestionControl as a_CongestionControl,
  a.MeanThroughputMbps as a_MeanThroughputMbps,
  a.MinRTT as a_MinRTT,
  a.LossRate as a_LossRate,
  CASE
    WHEN ARRAY_LENGTH(raw.Download.ServerMeasurements) >= 1 THEN
    (
        SELECT
        MAX(ServerMeas.TCPInfo.RTT) / 1e3,
        FROM UNNEST(raw.Download.ServerMeasurements) ServerMeas
    )
    WHEN ARRAY_LENGTH(raw.Upload.ServerMeasurements) >= 1 THEN
    (
        SELECT
        MAX(ServerMeas.TCPInfo.RTT) / 1e3,
        FROM UNNEST(raw.Upload.ServerMeasurements) ServerMeas
    )
    ELSE NULL -- Should not occur
  END a_MaxRTT,
  CASE
    WHEN ARRAY_LENGTH(raw.Download.ServerMeasurements) >= 1 THEN
    (
      SELECT AS STRUCT
        ANY_VALUE(GoodputMedian) AS GoodputMedian,
        ANY_VALUE(GoodputMean) AS GoodputMean,
        ANY_VALUE(ThroughputMedian) AS ThroughputMedian,
        ANY_VALUE(ThroughputMean) AS ThroughputMean
      FROM
        (
          SELECT
            PERCENTILE_CONT(Goodput, 0.5) OVER () AS GoodputMedian,
            AVG(Goodput) OVER () AS GoodputMean,
            PERCENTILE_CONT(Throughput, 0.5) OVER () AS ThroughputMedian,
            AVG(Throughput) OVER () AS ThroughputMean
          FROM
            (
              SELECT
                (BytesAcked - BytesAckedPrev) / (ElapsedTime - ElapsedTimePrev) * 8 / 1e6 AS Goodput,
                (BytesSent - BytesSentPrev) / (ElapsedTime - ElapsedTimePrev) * 8 / 1e6 AS Throughput
              FROM
                (
                  SELECT
                    ServerMeas.TCPInfo.BytesAcked AS BytesAcked,
                    ServerMeas.TCPInfo.BytesSent AS BytesSent,
                    ServerMeas.TCPInfo.ElapsedTime / 1e6 AS ElapsedTime,
                    IFNULL(LAG(ServerMeas.TCPInfo.BytesAcked) OVER (ORDER BY ServerMeas.TCPInfo.ElapsedTime), 0) AS BytesAckedPrev,
                    IFNULL(LAG(ServerMeas.TCPInfo.BytesSent) OVER (ORDER BY ServerMeas.TCPInfo.ElapsedTime), 0) AS BytesSentPrev,
                    IFNULL(LAG(ServerMeas.TCPInfo.ElapsedTime / 1e6) OVER (ORDER BY ServerMeas.TCPInfo.ElapsedTime), 0) AS ElapsedTimePrev
                  FROM UNNEST(raw.Download.ServerMeasurements) ServerMeas
                )
            )
        )
    ) 
    WHEN ARRAY_LENGTH(raw.Upload.ServerMeasurements) >= 1 THEN -- Upload
    (
      SELECT AS STRUCT
        ANY_VALUE(GoodputMedian) AS GoodputMedian,
        ANY_VALUE(GoodputMean) AS GoodputMean,
        NULL AS ThroughputMedian, -- can not compute throughput for upload tests
        NULL AS ThroughputMean
      FROM
        (
          SELECT
            PERCENTILE_CONT(Goodput, 0.5) OVER () AS GoodputMedian,
            AVG(Goodput) OVER () AS GoodputMean,
          FROM
            (
              SELECT
                (BytesReceived - BytesReceivedPrev) / (ElapsedTime - ElapsedTimePrev) * 8 / 1e6 AS Goodput
              FROM
                (
                  SELECT
                    ServerMeas.TCPInfo.BytesReceived AS BytesReceived,
                    ServerMeas.TCPInfo.ElapsedTime / 1e6 AS ElapsedTime,
                    IFNULL(LAG(ServerMeas.TCPInfo.BytesReceived) OVER (ORDER BY ServerMeas.TCPInfo.ElapsedTime), 0) AS BytesReceivedPrev,
                    IFNULL(LAG(ServerMeas.TCPInfo.ElapsedTime / 1e6) OVER (ORDER BY ServerMeas.TCPInfo.ElapsedTime), 0) AS ElapsedTimePrev
                  FROM UNNEST(raw.Upload.ServerMeasurements) ServerMeas
                  -- bytes_received is Goodput not throughput; bytes_sent is throughput as it includes retransmissions (read description of tcpEStatsPerfHCDataOctetsOut in rfc4898)
                  -- linux comment: RFC4898 tcpEStatsAppHCThruOctetsReceived, sum(delta(rcv_nxt)), or how many bytes were acked.
                  -- increased whenever we put data into the receive or ofo queue: https://elixir.bootlin.com/linux/latest/source/net/ipv4/tcp_input.c#L3537 
 
                )
            )
        )
    )
    ELSE NULL -- should not occur
  END ratesMbps

FROM filtered_data
)

SELECT * EXCEPT(ratesMbps),
ratesMbps.GoodputMedian AS GoodputMedian,
ratesMbps.GoodputMean AS GoodputMean,
ratesMbps.ThroughputMedian AS ThroughputMedian,
ratesMbps.ThroughputMean AS ThroughputMean
FROM value_data
