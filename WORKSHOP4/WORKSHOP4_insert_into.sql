use Alphabet_Company_DB;

INSERT INTO Country (country_id, name) VALUES
(UUID(), 'USA'),
(UUID(), 'Canada'),
(UUID(), 'Mexico'),
(UUID(), 'Colombia'),
(UUID(), 'UST (United States of Tunja');

INSERT INTO musicalgenre (id_genre, name, description) VALUES
(UUID(), 'Rock', 'Rock music genre'),
(UUID(), 'Pop', 'Pop music genre'),
(UUID(), 'Jazz', 'Jazz music genre'),
(UUID(), 'Ranchera', 'Ranchera lovers');

INSERT INTO users (user_id, name, email, phone, nickname, password, musical_genre_fk, country_fk) VALUES
(UUID(), 'Alice', 'alice@example.com', '123-456-7890', 'alice123', 'password123', (SELECT id_genre FROM musicalgenre WHERE name = 'Rock'), (SELECT country_id FROM Country WHERE name = 'USA')),
(UUID(), 'Aldous', 'bob@example.com', '234-567-8901', 'bob456', 'password456', (SELECT id_genre FROM musicalgenre WHERE name = 'Pop'), (SELECT country_id FROM Country WHERE name = 'Canada')),
(UUID(), 'Freud', 'charlie@example.com', '345-678-9012', 'charlie789', 'password789', (SELECT id_genre FROM musicalgenre WHERE name = 'Jazz'), (SELECT country_id FROM Country WHERE name = 'Mexico')),
(UUID(), 'Cachaco', 'cachacho@example.com', '322-682-2565', 'chochorrammo-salvaje', 'aguapanelaconpan', (SELECT id_genre FROM musicalgenre WHERE name = 'Ranchera'), (SELECT country_id FROM Country WHERE name = 'Colombia'));

INSERT INTO channels (id_channel, name, description, user_fk) VALUES
(UUID(), 'AliceChannel', 'Alice\'s Channel', (SELECT user_id FROM users WHERE nickname = 'alice123')),
(UUID(), 'BobChannel', 'Bob\'s Channel', (SELECT user_id FROM users WHERE nickname = 'bob456')),
(UUID(), 'CharlieChannel', 'Charlie\'s Channel', (SELECT user_id FROM users WHERE nickname = 'charlie789'));

INSERT INTO video (id_videos, description, date_upload, likes, dislikes, user_fk, genre_fk, channel_fk) VALUES
(UUID(), 'First Video', '2023-01-01 10:00:00', 25, 1, (SELECT user_id FROM users WHERE nickname = 'alice123'), (SELECT id_genre FROM musicalgenre WHERE name = 'Rock'), (SELECT id_channel FROM channels WHERE name = 'AliceChannel')),
(UUID(), 'Second Video', '2023-02-01 10:00:00', 15, 2, (SELECT user_id FROM users WHERE nickname = 'bob456'), (SELECT id_genre FROM musicalgenre WHERE name = 'Pop'), (SELECT id_channel FROM channels WHERE name = 'BobChannel')),
(UUID(), 'Third Video', '2023-03-01 10:00:00', 5, 0, (SELECT user_id FROM users WHERE nickname = 'charlie789'), (SELECT id_genre FROM musicalgenre WHERE name = 'Jazz'), (SELECT id_channel FROM channels WHERE name = 'CharlieChannel'));

INSERT INTO comments (id_comment, content, date_creation, likes, dislikes, user_fk, video_fk) VALUES
(UUID(), 'Más brusco que bebé con chucha', '2023-01-02 12:00:00', 5, 0, (SELECT user_id FROM users WHERE nickname = 'bob456'), (SELECT id_videos FROM video WHERE description = 'First Video')),
(UUID(), 'No papi más perdido que mi papá', '2023-02-02 12:00:00', 3, 0, (SELECT user_id FROM users WHERE nickname = 'charlie789'), (SELECT id_videos FROM video WHERE description = 'Second Video')),
(UUID(), 'Que pereza calculo integral', '2023-03-02 12:00:00', 8, 1, (SELECT user_id FROM users WHERE nickname = 'alice123'), (SELECT id_videos FROM video WHERE description = 'Third Video'));

INSERT INTO playlist (id_playlist, name, likes, user_fk) VALUES
(UUID(), 'Rock Playlist', 10, (SELECT user_id FROM users WHERE nickname = 'alice123')),
(UUID(), 'Pop Playlist', 20, (SELECT user_id FROM users WHERE nickname = 'bob456')),
(UUID(), 'Jazz Playlist', 5, (SELECT user_id FROM users WHERE nickname = 'charlie789')),
(UUID(), 'Rancheras Pa azotar baldosa playlist', 5, (SELECT user_id FROM users WHERE nickname = 'chochorrammo-salvaje'));

INSERT INTO playlist_video_REL (id_videos, id_playlist) VALUES
((SELECT id_videos FROM video WHERE description = 'First Video'), (SELECT id_playlist FROM playlist WHERE name = 'Rock Playlist')),
((SELECT id_videos FROM video WHERE description = 'Second Video'), (SELECT id_playlist FROM playlist WHERE name = 'Pop Playlist')),
((SELECT id_videos FROM video WHERE description = 'Third Video'), (SELECT id_playlist FROM playlist WHERE name = 'Jazz Playlist'));

INSERT INTO community (id_community, name, description) VALUES
(UUID(), 'Music Lovers', 'Community for music lovers'),
(UUID(), 'Rock Fans', 'Community for rock fans'),
(UUID(), 'Pop Enthusiasts', 'Community for pop enthusiasts');

INSERT INTO community_user_REL (id_community, user_id, expiration_date) VALUES
((SELECT id_community FROM community WHERE name = 'Music Lovers'), (SELECT user_id FROM users WHERE nickname = 'alice123'), '2024-01-01 00:00:00'),
((SELECT id_community FROM community WHERE name = 'Rock Fans'), (SELECT user_id FROM users WHERE nickname = 'bob456'), '2024-01-01 00:00:00'),
((SELECT id_community FROM community WHERE name = 'Pop Enthusiasts'), (SELECT user_id FROM users WHERE nickname = 'charlie789'), '2024-01-01 00:00:00');

INSERT INTO Subscriber_REL (user_id, id_channel, pay, pay_cost, date_subscriptions) VALUES
((SELECT user_id FROM users WHERE nickname = 'alice123'), (SELECT id_channel FROM channels WHERE name = 'AliceChannel'), TRUE, 9.99, '2023-01-01 00:00:00'),
((SELECT user_id FROM users WHERE nickname = 'bob456'), (SELECT id_channel FROM channels WHERE name = 'BobChannel'), FALSE, 0, '2023-02-01 00:00:00'),
((SELECT user_id FROM users WHERE nickname = 'charlie789'), (SELECT id_channel FROM channels WHERE name = 'CharlieChannel'), TRUE, 4.99, '2023-03-01 00:00:00');

INSERT INTO BankAccount (bank_id, bank_name, account_number, country_fk, user_fk) VALUES
(UUID(), 'Bank of America', '1234567890123456', (SELECT country_id FROM Country WHERE name = 'USA'), (SELECT user_id FROM users WHERE nickname = 'alice123')),
(UUID(), 'Royal Bank of Canada', '2345678901234567', (SELECT country_id FROM Country WHERE name = 'Canada'), (SELECT user_id FROM users WHERE nickname = 'bob456')),
(UUID(), 'Manuel_Bank', '3456789012345678', (SELECT country_id FROM Country WHERE name = 'Mexico'), (SELECT user_id FROM users WHERE nickname = 'charlie789'));
