SELECT t2.music_name AS nome,
COUNT(t1.music_id) AS reproducoes
FROM SpotifyClone.Playback AS t1
INNER JOIN SpotifyClone.Musics AS t2
ON t1.music_id = t2.music_id
GROUP BY nome
ORDER BY nome ASC;