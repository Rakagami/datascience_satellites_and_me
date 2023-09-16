WITH filtered_data as (
  SELECT 
    *
  FROM 
    `measurement-lab.ndt.ndt7`
  WHERE 
    date > DATE("2019-01-01") AND
    date < DATE("2022-12-01") AND
    client.Network.ASNumber != 14593 AND
    (
      a.MinRTT > 0.0 AND
      a.MeanThroughputMbps > 0.0 AND
      a.lossrate >= 0.0
    ) AND NOT(ARRAY_LENGTH(raw.Upload.ClientMetadata) = 0) AND
    EXISTS (
      SELECT 1
      FROM UNNEST(raw.Upload.ClientMetadata) AS element
      WHERE 
        element.Name != "access_token" AND
        (
          (element.Value LIKE '%arm%') OR 
          (element.Value LIKE '%android%')
        )
    )
)
SELECT 
  id,
  a.TestTime as a_TestTime,
  a.CongestionControl as a_CongestionControl,
  a.MeanThroughputMbps as a_MeanThroughputMbps,
  a.MinRTT as a_MinRTT,
  
  client.Geo.CountryName as client_Geo_CountryName,
  client.Geo.City as client_Geo_City,
  client.Geo.Latitude as client_Geo_Latitude,
  client.Geo.Longitude as client_Geo_Longitude,
  client.Network.ASNumber as client_Network_ASNumber,
  
  server.Site as server_Site,
  server.Machine as server_Machine,
  server.Geo.ContinentCode as server_Geo_ContinentCode,
  server.Geo.CountryCode as server_Geo_CountryCode,
  server.Geo.CountryName as server_Geo_CountryName,
  server.Geo.City as server_Geo_City,
  server.Network.CIDR as server_Network_CIDR,
  server.Network.ASNumber as server_Network_ASNumber,

  raw.Upload.ClientMetadata
FROM filtered_data
