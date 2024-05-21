-- TODOS LOS VIDEOS DE UN PAIS ESPECIFICO --
SELECT v.*
FROM video v
JOIN users u ON v.user_fk = u.user_id
JOIN Country c ON u.country_fk = c.country_id
WHERE c.name = 'USA';

-- GENEROS MUSICALES DISPONIBLES Y CUANTOS VIDEOS HAY --
SELECT mg.name AS genre_name, COUNT(v.id_videos) AS video_count
FROM musicalgenre mg
LEFT JOIN video v ON mg.id_genre = v.genre_fk
GROUP BY mg.name;

-- VIDEOS CON MÁS DE 20 LIKES, CORREO Y USUARIO QUE LO SUBIO --
SELECT v.*, u.name AS user_name, u.email AS user_email
FROM video v
JOIN users u ON v.user_fk = u.user_id
WHERE v.likes > 20;

-- USER, VIDEO, COMMENT CON LA PALABRA UGLY --
SELECT c.*, u.name AS user_name, u.email AS user_email, v.description AS video_description
FROM comments c
JOIN users u ON c.user_fk = u.user_id
JOIN video v ON c.video_fk = v.id_videos
WHERE c.content LIKE '%ugly%';
