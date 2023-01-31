SELECT MIN(t2.price) AS faturamento_minimo,
MAX(t2.price) AS faturamento_maximo,
ROUND(AVG(t2.price), 2) AS faturamento_medio,
SUM(t2.price) AS faturamento_total
FROM SpotifyClone.Users AS t1
INNER JOIN SpotifyClone.Subscription_plan AS t2
ON t1.plan_id = t2.plan_id;