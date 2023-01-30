SELECT DISTINCT t1.user_name AS usuario,
COUNT(t2.music_id) AS qt_de_musicas_ouvidas,
ROUND(SUM(DISTINCT t3.duration) / 60, 2) AS total_minutos
FROM SpotifyClone.Users AS t1
INNER JOIN SpotifyClone.Playback AS t2
ON t1.user_id = t2.user_id
INNER JOIN SpotifyClone.Musics AS t3
ON t2.music_id = t3.music_id
group by user_name;