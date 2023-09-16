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
    )
)
SELECT 
  client.Geo.City as ClientCity,
  client.Geo.CountryName as ClientCountry,
  ST_GEOHASH(ST_GEOGPOINT(client.Geo.Longitude, client.Geo.Latitude), 5) as ClientGeohash,
  COUNT(id) as MeasurementCount,
  MAX(a.TestTime) as MostRecentTestTime,
  MIN(a.TestTime) as LeastRecentTestTime
FROM filtered_data
GROUP BY
  client.Geo.City, client.Geo.CountryName, ClientGeohash
