SELECT t1.user_name AS usuario,
IF(YEAR(max(t2.playback_date)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.Users AS t1
INNER JOIN SpotifyClone.Playback AS t2
ON t1.user_id = t2.user_id
GROUP BY user_name
ORDER BY user_name ASC;