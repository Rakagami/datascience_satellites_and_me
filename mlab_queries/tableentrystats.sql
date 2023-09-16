SELECT
t2.month, ifnull(t1.entry_count, 0) as entry_count
FROM
(SELECT 
  date_sub(date, INTERVAL (EXTRACT(DAY FROM date)-1) DAY) as month,
  COUNT(id) as entry_count
FROM 
  `measurement-lab.ndt.ndt7`
WHERE 
  date > DATE("2019-01-01") AND
  date < DATE("2023-05-01") AND
  client.Network.ASNumber = 14593
GROUP BY
  month) t1
RIGHT JOIN 
(SELECT month
FROM UNNEST(
    GENERATE_DATE_ARRAY(DATE('2019-01-01'), DATE('2023-05-01'), INTERVAL 1 MONTH)
) AS month) t2
ON t1.month = t2.month;
