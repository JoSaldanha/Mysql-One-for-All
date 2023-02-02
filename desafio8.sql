SELECT t1.artist AS artista,
t2.album_name AS album
FROM SpotifyClone.Artists AS t1
INNER JOIN SpotifyClone.Albums AS t2
ON t1.artist_id = t2.artist_id
HAVING artista = 'Elis Regina'
ORDER BY album ASC;