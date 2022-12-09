# M-Lab Starlink Data

## Table Entry Stats

Just table entry stats to get a rough overview on how valuable the data is. It shows for each month since 2019-01-01 until 2022-12-01

```
SELECT
t2.month, ifnull(t1.entry_count, 0) as entry_count
FROM
(SELECT 
  date_sub(date, INTERVAL (EXTRACT(DAY FROM date)-1) DAY) as month,
  COUNT(id) as entry_count
FROM 
  `measurement-lab.ndt.[TABLENAME]`
WHERE 
  date > DATE("2019-01-01") AND
  date < DATE("2022-12-01") AND
  client.Network.ASNumber = 14593
GROUP BY
  month) t1
RIGHT JOIN 
(SELECT month
FROM UNNEST(
    GENERATE_DATE_ARRAY(DATE('2019-01-01'), CURRENT_DATE(), INTERVAL 1 MONTH)
) AS month) t2
ON t1.month = t2.month;
```

And we have three TABLENAMEs: (`ndt7`, `ndt5`, `web100`). So generated .csv files look like this:

- `ndt7_tableentrystats.csv`

- `ndt5_tableentrystats.csv`

- `web100_tableentrystats.csv` (pretty empty)

## Table Entry Count by Country

```
SELECT 
  client.Geo.CountryName,
  COUNT(id) as entry_count
FROM 
  `measurement-lab.ndt.[TABLENAME]`
WHERE 
  date > DATE("2019-01-01") AND
  date < DATE("2022-12-01") AND
  client.Network.ASNumber = 14593
GROUP BY
  client.Geo.CountryName
```

- `ndt5_countryentrycount.csv`
- `ndt7_countryentrycount.csv`
- `web100_countryentrycount.csv`

## Geospatial Data, GeoHash to Measurement

```
SELECT 
  ST_GEOHASH(ST_GEOGPOINT(client.Geo.Latitude, client.Geo.Latitude), 5) as geohash,
  AVG(a.MinRTT) as avg_minrtt,
  AVG(a.MeanThroughputMbps) as avg_meanthroughputmbps,
  AVG(a.LossRate) as avg_lossraate,
  COUNT(id) count_measurements
FROM 
  `measurement-lab.ndt.[TABLENAME]`
WHERE 
  date > DATE("2019-01-01") AND
  date < DATE("2022-12-01") AND
  client.Network.ASNumber = 14593
GROUP BY geohash
```

- `ndt5_geohash2diagnostic.csv`
- `ndt7_geohash2diagnostic.csv`
- `web100_geohash2diagnostic.csv`
