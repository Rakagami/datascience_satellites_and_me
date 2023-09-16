SELECT 
  ST_GEOHASH(ST_GEOGPOINT(client.Geo.Longitude, client.Geo.Latitude), 5) as geohash,
  AVG(a.MinRTT) as avg_minrtt,
  AVG(a.MeanThroughputMbps) as avg_meanthroughputmbps,
  AVG(a.LossRate) as avg_lossraate,
  COUNT(id) count_measurements
FROM 
  `measurement-lab.ndt.ndt7`
WHERE 
  date > DATE("2019-01-01") AND
  date < DATE("2023-05-01") AND
  client.Network.ASNumber = 14593
GROUP BY geohash
