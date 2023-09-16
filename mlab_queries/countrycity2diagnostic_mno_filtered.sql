WITH filtered_data as (
  SELECT 
    *
  FROM 
    `measurement-lab.ndt.ndt7`
  WHERE 
    date > DATE("2022-04-01") AND
    date < DATE("2023-05-01") AND (
      (client.Geo.CountryCode = server.Geo.CountryCode) OR
      (client.Geo.CountryName = "Saint Barthélemy" AND server.Geo.CountryCode = "CO") OR
      (client.Geo.CountryName = "Guadeloupe" AND server.Geo.CountryCode = "CO") OR
      (client.Geo.CountryName = "Dominican Republic" AND server.Geo.CountryCode = "US") OR
      (client.Geo.CountryName = "Puerto Rico" AND server.Geo.CountryCode = "US") OR
      (client.Geo.CountryName = "Martinique" AND server.Geo.CountryCode = "CO") OR
      (client.Geo.CountryName = "Austria" AND server.Geo.CountryCode = "CZ") 
    ) AND
    (
      (client.Geo.CountryName = "Netherlands" AND client.Network.ASNumber = 1136)OR
      (client.Geo.CountryName = "Netherlands" AND client.Network.ASNumber = 50266)OR
      (client.Geo.CountryName = "Netherlands" AND client.Network.ASNumber = 13127)OR
      (client.Geo.CountryName = "Dominican Republic" AND client.Network.ASNumber = 6400)OR
      (client.Geo.CountryName = "Dominican Republic" AND client.Network.ASNumber = 28118)OR
      (client.Geo.CountryName = "Dominican Republic" AND client.Network.ASNumber = 27887)OR
      (client.Geo.CountryName = "Canada" AND client.Network.ASNumber = 577)OR
      (client.Geo.CountryName = "Canada" AND client.Network.ASNumber = 812)OR
      (client.Geo.CountryName = "Canada" AND client.Network.ASNumber = 852)OR
      (client.Geo.CountryName = "Nigeria" AND client.Network.ASNumber = 29465)OR
      (client.Geo.CountryName = "Nigeria" AND client.Network.ASNumber = 36873)OR
      (client.Geo.CountryName = "Nigeria" AND client.Network.ASNumber = 328309)OR
      (client.Geo.CountryName = "Austria" AND client.Network.ASNumber = 8447)OR
      (client.Geo.CountryName = "Austria" AND client.Network.ASNumber = 8412)OR
      (client.Geo.CountryName = "Austria" AND client.Network.ASNumber = 25255)OR
      (client.Geo.CountryName = "Norway" AND client.Network.ASNumber = 2119)OR
      (client.Geo.CountryName = "Norway" AND client.Network.ASNumber = 12929)OR
      (client.Geo.CountryName = "Norway" AND client.Network.ASNumber = 15659)OR
      (client.Geo.CountryName = "Peru" AND client.Network.ASNumber = 12252)OR
      (client.Geo.CountryName = "Peru" AND client.Network.ASNumber = 6147)OR
      (client.Geo.CountryName = "Peru" AND client.Network.ASNumber = 21575)OR
      (client.Geo.CountryName = "Belgium" AND client.Network.ASNumber = 5432)OR
      (client.Geo.CountryName = "Belgium" AND client.Network.ASNumber = 47377)OR
      (client.Geo.CountryName = "Belgium" AND client.Network.ASNumber = 6848)OR
      (client.Geo.CountryName = "France" AND client.Network.ASNumber = 3215)OR
      (client.Geo.CountryName = "France" AND client.Network.ASNumber = 5410)OR
      (client.Geo.CountryName = "France" AND client.Network.ASNumber = 15557)OR
      (client.Geo.CountryName = "United Kingdom" AND client.Network.ASNumber = 12576)OR
      (client.Geo.CountryName = "United Kingdom" AND client.Network.ASNumber = 5089)OR
      (client.Geo.CountryName = "United Kingdom" AND client.Network.ASNumber = 5378)OR
      (client.Geo.CountryName = "Saint Barthélemy" AND client.Network.ASNumber = 3215)OR
      (client.Geo.CountryName = "United States" AND client.Network.ASNumber = 22394)OR
      (client.Geo.CountryName = "United States" AND client.Network.ASNumber = 20057)OR
      (client.Geo.CountryName = "United States" AND client.Network.ASNumber = 21928)OR
      (client.Geo.CountryName = "Brazil" AND client.Network.ASNumber = 18881)OR
      (client.Geo.CountryName = "Brazil" AND client.Network.ASNumber = 26615)OR
      (client.Geo.CountryName = "Brazil" AND client.Network.ASNumber = 28573)OR
      (client.Geo.CountryName = "Ireland" AND client.Network.ASNumber = 15502)OR
      (client.Geo.CountryName = "Ireland" AND client.Network.ASNumber = 5466)OR
      (client.Geo.CountryName = "Ireland" AND client.Network.ASNumber = 13280)OR
      (client.Geo.CountryName = "New Zealand" AND client.Network.ASNumber = 4771)OR
      (client.Geo.CountryName = "New Zealand" AND client.Network.ASNumber = 9500)OR
      (client.Geo.CountryName = "New Zealand" AND client.Network.ASNumber = 9790)OR
      (client.Geo.CountryName = "Italy" AND client.Network.ASNumber = 3269)OR
      (client.Geo.CountryName = "Italy" AND client.Network.ASNumber = 30722)OR
      (client.Geo.CountryName = "Italy" AND client.Network.ASNumber = 1267)OR
      (client.Geo.CountryName = "Mexico" AND client.Network.ASNumber = 28403)OR
      (client.Geo.CountryName = "Mexico" AND client.Network.ASNumber = 28469)OR
      (client.Geo.CountryName = "Australia" AND client.Network.ASNumber = 4804)OR
      (client.Geo.CountryName = "Australia" AND client.Network.ASNumber = 1221)OR
      (client.Geo.CountryName = "Australia" AND client.Network.ASNumber = 133612)OR
      (client.Geo.CountryName = "Philippines" AND client.Network.ASNumber = 10139)OR
      (client.Geo.CountryName = "Philippines" AND client.Network.ASNumber = 132199)OR
      (client.Geo.CountryName = "Chile" AND client.Network.ASNumber = 27651)OR
      (client.Geo.CountryName = "Chile" AND client.Network.ASNumber = 27995)OR
      (client.Geo.CountryName = "Chile" AND client.Network.ASNumber = 7418)OR
      (client.Geo.CountryName = "Germany" AND client.Network.ASNumber = 3320)OR
      (client.Geo.CountryName = "Germany" AND client.Network.ASNumber = 3209)OR
      (client.Geo.CountryName = "Germany" AND client.Network.ASNumber = 6805)OR
      (client.Geo.CountryName = "Martinique" AND client.Network.ASNumber = 48252)OR
      (client.Geo.CountryName = "Portugal" AND client.Network.ASNumber = 2860)OR
      (client.Geo.CountryName = "Portugal" AND client.Network.ASNumber = 15525)OR
      (client.Geo.CountryName = "Portugal" AND client.Network.ASNumber = 12353)OR
      (client.Geo.CountryName = "Puerto Rico" AND client.Network.ASNumber = 10396)OR
      (client.Geo.CountryName = "Puerto Rico" AND client.Network.ASNumber = 14638)OR
      (client.Geo.CountryName = "Puerto Rico" AND client.Network.ASNumber = 21928)OR
      (client.Geo.CountryName = "Colombia" AND client.Network.ASNumber = 10620)OR
      (client.Geo.CountryName = "Colombia" AND client.Network.ASNumber = 13489)OR
      (client.Geo.CountryName = "Colombia" AND client.Network.ASNumber = 27831)OR
      (client.Geo.CountryName = "Spain" AND client.Network.ASNumber = 3352)OR
      (client.Geo.CountryName = "Spain" AND client.Network.ASNumber = 12479)OR
      (client.Geo.CountryName = "Spain" AND client.Network.ASNumber = 12430)OR
      (client.Geo.CountryName = "Japan" AND client.Network.ASNumber = 9605)OR
      (client.Geo.CountryName = "Japan" AND client.Network.ASNumber = 2516)OR
      (client.Geo.CountryName = "Japan" AND client.Network.ASNumber = 17676)
    )
), 
filtered_data2 as (
  SELECT 
    *,
      (SELECT
        ANY_VALUE(MedianThroughputMbps) AS MedianThroughputMbps
        FROM
          (SELECT
          PERCENTILE_CONT(Goodput, 0.5) OVER () AS MedianThroughputMbps
          FROM
            (SELECT
            (BytesAcked - BytesAckedPrev) / (ElapsedTime - ElapsedTimePrev) * 8 / 1e6 AS Goodput
            FROM
              (SELECT
              ServerMeas.TCPInfo.BytesAcked AS BytesAcked,
              ServerMeas.TCPInfo.ElapsedTime / 1e6 AS ElapsedTime,
              IFNULL(LAG(ServerMeas.TCPInfo.BytesAcked) OVER (ORDER BY ServerMeas.TCPInfo.ElapsedTime), 0) AS BytesAckedPrev,
              IFNULL(LAG(ServerMeas.TCPInfo.ElapsedTime / 1e6) OVER (ORDER BY ServerMeas.TCPInfo.ElapsedTime), 0) AS ElapsedTimePrev
              FROM UNNEST(raw.Download.ServerMeasurements) ServerMeas
              )
            )
      )
  ),
  FROM filtered_data
),
five_number_summary as (
  SELECT
    *,

    PERCENTILE_CONT(a.MeanThroughputMbps, 0.0)  OVER(PARTITION BY client.Geo.CountryName) AS MeanThroughputMbps_q0,
    PERCENTILE_CONT(a.MeanThroughputMbps, 0.25) OVER(PARTITION BY client.Geo.CountryName) AS MeanThroughputMbps_q1,
    PERCENTILE_CONT(a.MeanThroughputMbps, 0.5)  OVER(PARTITION BY client.Geo.CountryName) AS MeanThroughputMbps_q2,
    PERCENTILE_CONT(a.MeanThroughputMbps, 0.75) OVER(PARTITION BY client.Geo.CountryName) AS MeanThroughputMbps_q3,
    PERCENTILE_CONT(a.MeanThroughputMbps, 1.0)  OVER(PARTITION BY client.Geo.CountryName) AS MeanThroughputMbps_q4,

    PERCENTILE_CONT(a.MinRTT, 0.0)  OVER(PARTITION BY client.Geo.CountryName) AS MinRTT_q0,
    PERCENTILE_CONT(a.MinRTT, 0.25) OVER(PARTITION BY client.Geo.CountryName) AS MinRTT_q1,
    PERCENTILE_CONT(a.MinRTT, 0.5)  OVER(PARTITION BY client.Geo.CountryName) AS MinRTT_q2,
    PERCENTILE_CONT(a.MinRTT, 0.75) OVER(PARTITION BY client.Geo.CountryName) AS MinRTT_q3,
    PERCENTILE_CONT(a.MinRTT, 1.0)  OVER(PARTITION BY client.Geo.CountryName) AS MinRTT_q4,

    PERCENTILE_CONT(a.lossrate, 0.0)  OVER(PARTITION BY client.Geo.CountryName) AS lossrate_q0,
    PERCENTILE_CONT(a.lossrate, 0.25) OVER(PARTITION BY client.Geo.CountryName) AS lossrate_q1,
    PERCENTILE_CONT(a.lossrate, 0.5)  OVER(PARTITION BY client.Geo.CountryName) AS lossrate_q2,
    PERCENTILE_CONT(a.lossrate, 0.75) OVER(PARTITION BY client.Geo.CountryName) AS lossrate_q3,
    PERCENTILE_CONT(a.lossrate, 1.0)  OVER(PARTITION BY client.Geo.CountryName) AS lossrate_q4,
  FROM filtered_data2
)
SELECT 
  client.Geo.CountryName,
  ANY_VALUE(client.Geo.CountryCode),
  AVG(client.Geo.Latitude) as avg_latitude,
  AVG(client.Geo.Longitude) as avg_longitude,
  AVG(a.MinRTT) as avg_minrtt,
  
  ANY_VALUE(five_number_summary.MinRTT_q2) as median_minrtt,

  AVG(a.MeanThroughputMbps) as avg_meanthroughputmbps,
  AVG(a.LossRate) as avg_lossraate,
  MAX(a.TestTime) as MostRecentTestTime,
  MIN(a.TestTime) as LeastRecentTestTime,
  DATE_DIFF(MAX(a.TestTime), MIN(a.TestTime), DAY) as TestSpanDays,
  COUNT(id) count_measurements
FROM 
  five_number_summary
GROUP BY client.Geo.CountryName
