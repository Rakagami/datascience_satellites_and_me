SELECT DISTINCT
  server.Site,
  server.Geo.CountryCode,
  server.Geo.City,
  server.Geo.Latitude,
  server.Geo.Longitude,
  server.Network.ASNumber
FROM 
    ndt.ndt7
  WHERE 
    date >= DATE("2019-01-01") AND
    date <= DATE("2023-03-01") AND
    a.MinRTT > 0.0 AND
    a.MeanThroughputMbps > 0.0 AND
    a.lossrate >= 0.0 AND
    client.Network.ASNumber IS NOT NULL
ORDER BY server.Site

