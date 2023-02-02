SELECT t2.artist AS artista,
t1.album_name AS album,
COUNT(t3.artist_id) AS seguidores
FROM SpotifyClone.Albums AS t1
INNER JOIN SpotifyClone.Artists AS t2
ON t1.artist_id = t2.artist_id
INNER JOIN SpotifyClone.Following_artists AS t3
ON t3.artist_id = t2.artist_id
GROUP BY t2.artist, t1.album_name
ORDER BY seguidores DESC, artista ASC, album ASC;