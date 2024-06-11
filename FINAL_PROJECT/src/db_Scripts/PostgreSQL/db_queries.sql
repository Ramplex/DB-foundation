-- GET THE UUID OF A CARD BY ITS NAME AND THE UUID OF THE LIST IT BELONGS TO --
SELECT id AS card_uuid
FROM cards
WHERE name = 'card_name' AND list_id = 'list_uuid';

-- GET THE UUID OF A USER BY THEIR USERNAME --
SELECT id AS user_uuid
FROM users
WHERE username = 'user_name';

-- GET THE BOARDS OF A USER BY THEIR USERNAME --
SELECT b.id, b.name, b.created_date, b.is_public
FROM boards b
INNER JOIN users u ON b.user_id = u.id
WHERE u.username = 'user_name';

-- GET THE ACTIVE CARDS OF A BOARD --
SELECT b.name AS board_name, COUNT(c.id) AS active_cards
FROM boards b
LEFT JOIN lists l ON b.id = l.board_id
LEFT JOIN cards c ON l.id = c.list_id AND c.is_active = TRUE
GROUP BY b.id
ORDER BY active_cards DESC;

-- GET THE MOST RECENT COMMENTS ON A SPECIFIC CARD --
SELECT u.username, com.content, com.created_date
FROM comments com
INNER JOIN users u ON com.user_id = u.id
WHERE com.card_id = 'card_uuid'
ORDER BY com.created_date DESC
LIMIT 10;

-- GET THE ACTIVITIES OF A USER ON ALL CARDS --
SELECT ca.activity, ca.created_date, c.name AS card_name, b.name AS board_name
FROM card_activity ca
INNER JOIN cards c ON ca.card_id = c.id
INNER JOIN lists l ON c.list_id = l.id
INNER JOIN boards b ON l.board_id = b.id
WHERE ca.user_id = 'user_uuid'
ORDER BY ca.created_date DESC;

-- GET THE ACTIVITY STATISTICS BY BOARD --
SELECT b.name AS board_name, COUNT(ca.id) AS activity_count
FROM boards b
LEFT JOIN lists l ON b.id = l.board_id
LEFT JOIN cards c ON l.id = c.list_id
LEFT JOIN card_activity ca ON c.id = ca.card_id
GROUP BY b.id
ORDER BY activity_count DESC;

-- GET THE USERS WITH THE MOST COMMENTS MADE --
SELECT u.username, COUNT(com.id) AS comment_count
FROM users u
LEFT JOIN comments com ON u.id = com.user_id
GROUP BY u.id
ORDER BY comment_count DESC
LIMIT 10;

-- GET THE MOST RECENT PUBLIC BOARDS --
SELECT b.name, b.created_date, u.username
FROM boards b
INNER JOIN users u ON b.user_id = u.id
WHERE b.is_public = TRUE
ORDER BY b.created_date DESC
LIMIT 10;

-- GET THE CARDS THAT ARE OVERDUE --
SELECT c.name, c.description, c.due_date
FROM cards c
WHERE c.due_date < CURRENT_DATE AND c.is_active = TRUE
ORDER BY c.due_date DESC;

-- GET THE CARDS WITH REMINDER FOR TODAY --
SELECT c.name, c.description, c.due_date, c.reminder_date
FROM cards c
WHERE c.reminder_date = CURRENT_DATE
ORDER BY c.created_date DESC;

-- LIST THE NUMBER OF BOARDS PER USER --
SELECT u.username, COUNT(b.id) AS board_count
FROM users u
LEFT JOIN boards b ON u.id = b.user_id
GROUP BY u.id
ORDER BY board_count DESC;
