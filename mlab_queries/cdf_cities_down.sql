WITH ndt_filtered AS (
  SELECT
  *,
  CASE 
    WHEN client.Network.ASNumber = 14593 THEN "sl"
    WHEN (
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
      ) THEN "topmno"
    ELSE "other"
  END Operator,
  FROM 
    ndt.ndt7
  WHERE 
    date >= DATE("2021-06-01") AND
    date <= DATE("2023-05-01") AND
    a.MinRTT > 0.0 AND
    a.MeanThroughputMbps > 0.0 AND
    a.lossrate >= 0.0 AND
    TIMESTAMP_DIFF(raw.EndTime, raw.StartTime, SECOND) >= 8
    AND (ARRAY_LENGTH(raw.Download.ServerMeasurements) > 5) AND
    client.Network.ASNumber IS NOT NULL AND (
      (client.Geo.CountryCode = server.Geo.CountryCode) OR
      (client.Geo.CountryName = "Saint Barthélemy" AND server.Geo.CountryCode = "CO") OR
      (client.Geo.CountryName = "Guadeloupe" AND server.Geo.CountryCode = "CO") OR
      (client.Geo.CountryName = "Dominican Republic" AND server.Geo.CountryCode = "US") OR
      (client.Geo.CountryName = "Puerto Rico" AND server.Geo.CountryCode = "US") OR
      (client.Geo.CountryName = "Martinique" AND server.Geo.CountryCode = "CO") OR
      (client.Geo.CountryName = "Austria" AND server.Geo.CountryCode = "CZ") 
    ) AND ( # Going through every city with mlab measurements
      (client.Geo.City = "Seattle") OR
      (client.Geo.City = "Chicago") OR
      (client.Geo.City = "Dallas") OR
      (client.Geo.City = "Los Angeles") OR
      (client.Geo.City = "Atlanta") OR
      (client.Geo.City = "Sydney") OR
      (client.Geo.City = "Toronto") OR
      (client.Geo.City = "New York") OR
      (client.Geo.City = "London") OR
      (client.Geo.City = "Denver") OR
      (client.Geo.City = "Mexico City") OR
      (client.Geo.City = "São Paulo") OR
      (client.Geo.City = "Vancouver") OR
      (client.Geo.City = "Berlin") OR
      (client.Geo.City = "Calgary") OR
      (client.Geo.City = "Auckland") OR
      (client.Geo.City = "Winnipeg") OR
      (client.Geo.City = "Rome") OR
      (client.Geo.City = "Montreal") OR
      (client.Geo.City = "Paris") OR
      (client.Geo.City = "Dublin") OR
      (client.Geo.City = "Santiago") OR
      (client.Geo.City = "Lagos") OR
      (client.Geo.City = "Madrid") OR
      (client.Geo.City = "Manila") OR
      (client.Geo.City = "Bogotá") OR
      (client.Geo.City = "Tokyo") OR
      (client.Geo.City = "Brussels") OR
      (client.Geo.City = "Lisbon") OR
      (client.Geo.City = "Vienna") OR
      (client.Geo.City = "Amsterdam") OR
      (client.Geo.City = "Lima") OR
      (client.Geo.City = "Prague") OR
      (client.Geo.City = "Santo Domingo") OR
      (client.Geo.City = "Fort-de-France") OR
      (client.Geo.City = "Charlotte Amalie") OR
      (client.Geo.City = "Oslo") OR
      (client.Geo.City = "Bowling Green") OR
      (client.Geo.City = "Gustavia") OR
      (client.Geo.City = "Hampton") OR
      (client.Geo.City = "San Juan") OR
      (client.Geo.City = "Warsaw") OR
      (client.Geo.City = "McCall") OR
      (client.Geo.City = "Kyiv") OR
      (client.Geo.City = "Marigot") OR
      (client.Geo.City = "Stockholm") OR
      (client.Geo.City = "Chester") OR
      (client.Geo.City = "Crestview") OR
      (client.Geo.City = "Kingston") OR
      (client.Geo.City = "Newaygo") OR
      (client.Geo.City = "Hermann") OR
      (client.Geo.City = "Basse-Terre") OR
      (client.Geo.City = "Danbury") OR
      (client.Geo.City = "Niota") OR
      (client.Geo.City = "Perth") OR
      (client.Geo.City = "Naples") OR
      (client.Geo.City = "Athens") OR
      (client.Geo.City = "Shelburn") OR
      (client.Geo.City = "Noojee") OR
      (client.Geo.City = "Hunnewell") OR 
      (client.Geo.City = "Wrenshall") OR
      (client.Geo.City = "Fall River Mills") OR
      (client.Geo.City = "Cayenne") OR
      (client.Geo.City = "Nuku'alofa") OR
      (client.Geo.City = "Kellevie") OR
      (client.Geo.City = "Balcarres") OR
      (client.Geo.City = "Howell") OR
      (client.Geo.City = "Augusta") OR
      (client.Geo.City = "Richer") OR
      (client.Geo.City = "Jakarta") OR
      (client.Geo.City = "Pleasant View") OR
      (client.Geo.City = "Bororen") OR
      (client.Geo.City = "Middleburg") OR
      (client.Geo.City = "Kalispell") OR
      (client.Geo.City = "Morganfield") OR
      (client.Geo.City = "Prineville") OR
      (client.Geo.City = "Saint-Denis") OR
      (client.Geo.City = "Mount Shasta") OR
      (client.Geo.City = "Yinnar South") OR
      (client.Geo.City = "Mazomanie") OR
      (client.Geo.City = "Dorr") OR
      (client.Geo.City = "Adelaide Hills") OR
      (client.Geo.City = "Evansville") OR
      (client.Geo.City = "Port-au-Prince") OR
      (client.Geo.City = "Rutherglen") OR
      (client.Geo.City = "Madison") OR
      (client.Geo.City = "Sofia") OR
      (client.Geo.City = "Copenhagen") OR
      (client.Geo.City = "Mandurah") OR
      (client.Geo.City = "Paris Creek") OR
      (client.Geo.City = "Zagreb") OR
      (client.Geo.City = "Eagle River") OR
      (client.Geo.City = "Tallinn") OR
      (client.Geo.City = "Bucharest") OR
      (client.Geo.City = "Huson") OR
      (client.Geo.City = "Bratislava") OR
      (client.Geo.City = "South Bend") OR
      (client.Geo.City = "Glenville") OR
      (client.Geo.City = "Vilnius") OR
      (client.Geo.City = "M'Sapere") OR
      (client.Geo.City = "Alto") OR
      (client.Geo.City = "Helena") OR
      (client.Geo.City = "Andover") OR
      (client.Geo.City = "Booroobin") OR
      (client.Geo.City = "Riga") OR
      (client.Geo.City = "Windsor") OR
      (client.Geo.City = "Dedham") OR
      (client.Geo.City = "Woodstock") OR
      (client.Geo.City = "Chippewa Falls") OR
      (client.Geo.City = "Corrigin") OR
      (client.Geo.City = "Watseka") OR
      (client.Geo.City = "Quito") OR
      (client.Geo.City = "Maputo") OR
      (client.Geo.City = "Kigali") OR
      (client.Geo.City = "Fond du Lac") OR
      (client.Geo.City = "Narrikup") OR
      (client.Geo.City = "St Peter Port") OR
      (client.Geo.City = "San Salvador") OR
      (client.Geo.City = "Ljubljana") OR
      (client.Geo.City = "Cairo") OR
      (client.Geo.City = "Wild Rose") OR
      (client.Geo.City = "Kenthurst") OR
      (client.Geo.City = "Eyota") OR
      (client.Geo.City = "Maitland") OR
      (client.Geo.City = "Budapest") OR
      (client.Geo.City = "Andenne") OR
      (client.Geo.City = "Moriah") OR
      (client.Geo.City = "Zurich") OR
      (client.Geo.City = "Waddell") OR
      (client.Geo.City = "Benayeo") OR
      (client.Geo.City = "St Fillans") OR
      (client.Geo.City = "Green River") OR
      (client.Geo.City = "Silverwood") OR
      (client.Geo.City = "Nairobi") OR
      (client.Geo.City = "Coshocton") OR
      (client.Geo.City = "Willemstad") OR
      (client.Geo.City = "Valley") OR
      (client.Geo.City = "Chisinau") OR
      (client.Geo.City = "Bridgetown") OR
      (client.Geo.City = "Peelhurst") OR
      (client.Geo.City = "Concho") OR
      (client.Geo.City = "Rainbow Beach") OR
      (client.Geo.City = "Valletta") OR
      (client.Geo.City = "Skopje") OR
      (client.Geo.City = "Elkton") OR
      (client.Geo.City = "Mackay") OR
      (client.Geo.City = "Honiara") OR
      (client.Geo.City = "Orangeville") OR
      (client.Geo.City = "Myrtle Point")
    )
),

data AS (
  SELECT
  *,
  (
    SELECT AS STRUCT
    MAX(ServerMeas.TCPInfo.MinRTT) / 1e3 AS minRTT,
    MAX(ServerMeas.TCPInfo.RTT) / 1e3 AS maxRTT,
    (MAX(ServerMeas.TCPInfo.RTT) - MAX(ServerMeas.TCPInfo.MinRTT)) / 1e3 AS diffRTT,
    MAX(ServerMeas.TCPInfo.Reordering) as maxReord,
    SUM(ServerMeas.TCPInfo.Retrans) as retrans,
    SUM(ServerMeas.TCPInfo.Lost) AS lost,
    SUM(ServerMeas.TCPInfo.Retrans) / MAX(ServerMeas.TCPInfo.DataSegsOut) * 100 AS retransPerc,
    FROM UNNEST(raw.Download.ServerMeasurements) ServerMeas
  ) m_download,
  FROM ndt_filtered
  WHERE ARRAY_LENGTH(raw.Download.ServerMeasurements) >= 1
  AND (
    SELECT
    MAX(ServerMeas.TCPInfo.RTT) > MAX(ServerMeas.TCPInfo.MinRTT),
    FROM UNNEST(raw.Download.ServerMeasurements) ServerMeas
  ) # some are unitialized where minRTT = 4294967295 and maxRTT = 0
)

SELECT
  client.Geo.City as ClientCity,
  Operator,
  client.Geo.CountryCode as ClientCountryCode,
  server.Geo.CountryCode as ServerCountryCode,
  APPROX_QUANTILES(m_download.diffRTT, 100) AS down_queuedelay_percentiles,
  APPROX_QUANTILES(a.LossRate, 100) AS lossrate_percentiles,
  APPROX_QUANTILES(m_download.minRTT, 100) AS minrtt_percentiles,
  count(*) AS MeasurementCount
FROM data
GROUP BY Operator, ClientCity, ClientCountryCode, ServerCountryCode
