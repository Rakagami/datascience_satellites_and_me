-- Supplemental mlab data containing Stockholm, Auckland and Mexico adjacent cities
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
      (
        (client.Geo.Latitude  > 8.3) AND
        (client.Geo.Latitude  < 28) AND 
        (client.Geo.Longitude > -118.2) AND
        (client.Geo.Longitude < -50) AND
        (client.Geo.City != "Mexico City")
      ) OR
      (
        (client.Geo.City = "Stockholm") OR
        (client.Geo.City = "Auckland")
      )
    )
),
value_data as (
  SELECT 
  id,
  date,
  CASE WHEN ARRAY_LENGTH(raw.Download.ServerMeasurements) >= 1 THEN False else True END isDownload,

  server.Site as server_Site,
  server.Geo.CountryCode as server_Geo_CountryCode,
  server.Geo.CountryName as server_Geo_CountryName,
  server.Geo.City as server_Geo_City,
  server.Geo.Latitude as server_Geo_Latitude,
  server.Geo.Longitude as server_Geo_Longitude,
  server.Network.CIDR as server_Network_CIDR,
  server.Network.ASNumber as server_Network_ASNumber,

  client.Geo.ContinentCode as client_Geo_ContinentCode,
  client.Geo.CountryCode as client_Geo_CountryCode,
  client.Geo.CountryName as client_Geo_CountryName,
  client.Geo.City as client_Geo_City,
  client.Geo.Latitude as client_Geo_Latitude,
  client.Geo.Longitude as client_Geo_Longitude,
  client.Geo.AccuracyRadiusKm as client_Geo_AccuracyRadiusKm,
  client.Network.CIDR as client_Network_CIDR,
  client.Network.ASNumber as client_Network_ASNumber,

  raw.ServerIP as raw_ServerIP,
  raw.ServerPort as raw_ServerPort,
  raw.ClientIP as raw_ClientIP,
  raw.ClientPort as raw_ClientPort,

  a.TestTime as a_TestTime,
  a.CongestionControl as a_CongestionControl,
  a.MeanThroughputMbps as a_MeanThroughputMbps,
  a.MinRTT as a_MinRTT,
  a.LossRate as a_LossRate,
  CASE WHEN ARRAY_LENGTH(raw.Download.ServerMeasurements) >= 1 THEN
    (
        SELECT
        MAX(ServerMeas.TCPInfo.RTT) / 1e3,
        FROM UNNEST(raw.Download.ServerMeasurements) ServerMeas
    )
  ELSE
    (
        SELECT
        MAX(ServerMeas.TCPInfo.RTT) / 1e3,
        FROM UNNEST(raw.Upload.ServerMeasurements) ServerMeas
    )
  END a_MaxRTT,
  CASE WHEN ARRAY_LENGTH(raw.Download.ServerMeasurements) >= 1 THEN 
    (
      SELECT
        ANY_VALUE(GoodputMedian) AS GoodputMedian
      FROM
        (
          SELECT
            PERCENTILE_CONT(Goodput, 0.5) OVER () AS GoodputMedian
          FROM
            (
              SELECT
                (BytesAcked - BytesAckedPrev) / (ElapsedTime - ElapsedTimePrev) * 8 / 1e6 AS Goodput
              FROM
                (
                  SELECT
                    ServerMeas.TCPInfo.BytesAcked AS BytesAcked,
                    ServerMeas.TCPInfo.ElapsedTime / 1e6 AS ElapsedTime,
                    IFNULL(LAG(ServerMeas.TCPInfo.BytesAcked) OVER (ORDER BY ServerMeas.TCPInfo.ElapsedTime), 0) AS BytesAckedPrev,
                    IFNULL(LAG(ServerMeas.TCPInfo.ElapsedTime / 1e6) OVER (ORDER BY ServerMeas.TCPInfo.ElapsedTime), 0) AS ElapsedTimePrev
                  FROM UNNEST(raw.Download.ServerMeasurements) ServerMeas
                )
            )
        )
    ) 
  ELSE 
    (
      SELECT
        ANY_VALUE(GoodputMedian) AS GoodputMedian
      FROM
        (
          SELECT
            PERCENTILE_CONT(Goodput, 0.5) OVER () AS GoodputMedian
          FROM
            (
              SELECT
                (BytesAcked - BytesAckedPrev) / (ElapsedTime - ElapsedTimePrev) * 8 / 1e6 AS Goodput
              FROM
                (
                  SELECT
                    ServerMeas.TCPInfo.BytesAcked AS BytesAcked,
                    ServerMeas.TCPInfo.ElapsedTime / 1e6 AS ElapsedTime,
                    IFNULL(LAG(ServerMeas.TCPInfo.BytesAcked) OVER (ORDER BY ServerMeas.TCPInfo.ElapsedTime), 0) AS BytesAckedPrev,
                    IFNULL(LAG(ServerMeas.TCPInfo.ElapsedTime / 1e6) OVER (ORDER BY ServerMeas.TCPInfo.ElapsedTime), 0) AS ElapsedTimePrev
                  FROM UNNEST(raw.Upload.ServerMeasurements) ServerMeas
                )
            )
        )
    ) 
  END a_MedianThroughputMbps,
FROM filtered_data
)
SELECT * FROM value_data

