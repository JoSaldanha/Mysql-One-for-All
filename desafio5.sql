SELECT distinct t1.music_name AS cancao,
COUNT(t2.music_id) AS reproducoes
FROM SpotifyClone.Musics AS t1
INNER JOIN SpotifyClone.Playback AS t2
ON t1.music_id = t2.music_id
GROUP BY music_name
HAVING COUNT(t2.music_id) = 3
ORDER BY t1.music_name ASC;