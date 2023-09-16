SELECT 
  client.Geo.City,
  COUNT(id),
  MIN(a.MeanThroughputMbps) as thoughputmbps_min,
  MAX(a.MeanThroughputMbps) as thoughputmbps_max,
  AVG(a.MeanThroughputMbps) as thoughputmbps_avg,
  VARIANCE(a.MeanThroughputMbps) as thoughputmbps_var,
  MIN(a.MinRTT) as minrtt_min,
  MAX(a.MinRTT) as minrtt_max,
  AVG(a.MinRTT) as minrtt_avg,
  VARIANCE(a.MinRTT) as minrtt_var,
  MIN(a.lossrate) as lossrate_min,
  MAX(a.lossrate) as lossrate_max,
  AVG(a.lossrate) as lossrate_avg,
  VARIANCE(a.lossrate) as lossrate_var,
FROM 
  `measurement-lab.ndt.ndt7`
WHERE 
  date > DATE("2019-01-01") AND
  date < DATE("2022-12-01") AND
  client.Network.ASNumber = 14593 AND (
    (client.Geo.City = "Sydney") OR
    (client.Geo.City = "Oslo") OR
    (client.Geo.City = "Mexico City") OR
    (client.Geo.City = "Bogotá") OR
    (client.Geo.City = "Seattle")
  )
GROUP BY
  client.Geo.City
#GROUP BY client.Geo.CountryName, client.Geo.City
