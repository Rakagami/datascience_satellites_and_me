WITH filtered_data as (
  SELECT 
    *
  FROM 
    `measurement-lab.ndt.ndt7`
  WHERE 
    date > DATE("2019-05-01") AND
    date < DATE("2023-05-01") AND
    (
      client.Geo.CountryName = "Japan"
    )
), total_count as (
  SELECT
    count(*) as total_count
  FROM filtered_data
), filtered_data_mobile as (
  SELECT
    client.Network.ASNumber as ASNumber,
    count(*) as total_count
  FROM filtered_data
  WHERE (
      EXISTS (
        SELECT 1
        FROM UNNEST(raw.Upload.ClientMetadata) AS element
        WHERE 
          element.Name != "access_token" AND
          (
            (element.Value LIKE '%arm%') OR 
            (element.Value LIKE '%android%') OR 
            (element.Value LIKE '%ios%')
          )
      ) OR
      EXISTS (
        SELECT 1
        FROM UNNEST(raw.Download.ClientMetadata) AS element
        WHERE 
          element.Name != "access_token" AND
          (
            (element.Value LIKE '%arm%') OR 
            (element.Value LIKE '%android%') OR 
            (element.Value LIKE '%ios%')
          )
      )
    )
  GROUP BY
    client.Network.ASNumber
)
SELECT
  client.Network.ASNumber,
  ANY_VALUE(client.Network.ASName) as ASName,
  count(id) as MeasurementCount,
  ANY_VALUE(filtered_data_mobile.total_count) / count(id) as MobileRatio,
  ANY_VALUE(filtered_data_mobile.total_count) as MobileCount,
  ANY_VALUE(total_count.total_count) as TotalCount,
  count(id) / ANY_VALUE(total_count.total_count) as MeasurementCountRatio,
  MAX(a.TestTime) as MostRecentTestTime,
  MIN(a.TestTime) as LeastRecentTestTime,
  DATE_DIFF(MAX(a.TestTime), MIN(a.TestTime), DAY) as TestSpanDays,
FROM filtered_data, total_count, filtered_data_mobile
WHERE
  filtered_data.client.Network.ASNumber = filtered_data_mobile.ASNumber
GROUP BY client.Network.ASNumber
ORDER BY MeasurementCount DESC
