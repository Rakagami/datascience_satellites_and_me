WITH ndt_filtered AS (
  SELECT
  *,
  FROM 
    ndt.ndt7
  WHERE 
    date >= DATE("2019-01-01") AND
    date <= DATE("2023-05-01") AND
    a.MinRTT > 0.0 AND
    a.MeanThroughputMbps > 0.0 AND
    a.lossrate >= 0.0 AND
    client.Network.ASNumber = 14593 AND (
      (client.Geo.CountryCode = server.Geo.CountryCode) OR
      (client.Geo.CountryName = "Saint Barthélemy" AND server.Geo.CountryCode = "CO") OR
      (client.Geo.CountryName = "Guadeloupe" AND server.Geo.CountryCode = "CO") OR
      (client.Geo.CountryName = "Dominican Republic" AND server.Geo.CountryCode = "US") OR
      (client.Geo.CountryName = "Puerto Rico" AND server.Geo.CountryCode = "US") OR
      (client.Geo.CountryName = "Martinique" AND server.Geo.CountryCode = "CO") OR
      (client.Geo.CountryName = "Austria" AND server.Geo.CountryCode = "CZ") 
    ) AND (
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
  ) m,
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
  client.Geo.CountryCode as ClientCountryCode,
  server.Geo.CountryCode as ServerCountryCode,
  APPROX_QUANTILES(m.diffRTT, 100) AS queuedelay_percentiles
FROM data
GROUP BY ClientCity, ClientCountryCode, ServerCountryCode
