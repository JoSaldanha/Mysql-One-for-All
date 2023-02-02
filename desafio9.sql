SELECT COUNT(t1.music_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.Playback AS t1
INNER JOIN SpotifyClone.Users AS t2
ON t1.user_id = t2.user_id
WHERE t2.user_name = 'Barbara Liskov';