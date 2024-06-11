-- USERS TABLE UUIDs
SELECT BIN_TO_UUID(id) AS 'UUID', first_name, last_name, username FROM users;

-- BOARDS TABLE UUIDs
SELECT BIN_TO_UUID(boards.id) AS 'Board UUID', users.first_name, users.last_name, users.username
FROM boards
INNER JOIN users ON boards.user_id = users.id;

-- LISTS TABLE UUIDs
SELECT BIN_TO_UUID(lists.id) AS 'List UUID', users.first_name, users.last_name, users.username
FROM lists
INNER JOIN boards ON lists.board_id = boards.id
INNER JOIN users ON boards.user_id = users.id;

-- CARDS TABLE UUIDs
SELECT BIN_TO_UUID(cards.id) AS 'Card UUID', users.first_name, users.last_name, users.username
FROM cards
INNER JOIN lists ON cards.list_id = lists.id
INNER JOIN boards ON lists.board_id = boards.id
INNER JOIN users ON boards.user_id = users.id;

-- BOARD MEMBERS TABLE UUIDs
SELECT BIN_TO_UUID(board_user.board_id) AS 'Board UUID', BIN_TO_UUID(board_user.user_id) AS 'User UUID', users.first_name, users.last_name, users.username
FROM board_user
INNER JOIN users ON board_user.user_id = users.id;

-- COMMENTS TABLE UUIDs
SELECT BIN_TO_UUID(comments.id) AS 'Comment UUID', users.first_name, users.last_name, users.username
FROM comments
INNER JOIN users ON comments.user_id = users.id;

-- CHECKLISTS TABLE UUIDs
SELECT BIN_TO_UUID(checklists.id) AS 'Checklist UUID', users.first_name, users.last_name, users.username
FROM checklists
INNER JOIN cards ON checklists.card_id = cards.id
INNER JOIN lists ON cards.list_id = lists.id
INNER JOIN boards ON lists.board_id = boards.id
INNER JOIN users ON boards.user_id = users.id;

-- CARD MEMBERS TABLE UUIDs
SELECT BIN_TO_UUID(card_user.card_id) AS 'Card UUID', BIN_TO_UUID(card_user.user_id) AS 'User UUID', users.first_name, users.last_name, users.username
FROM card_user
INNER JOIN users ON card_user.user_id = users.id;

-- CARD ACTIVITIES TABLE UUIDs
SELECT BIN_TO_UUID(card_activity.id) AS 'Activity UUID', users.first_name, users.last_name, users.username
FROM card_activity
INNER JOIN users ON card_activity.user_id = users.id;

-- CORE_LABELS TABLE UUIDs
SELECT BIN_TO_UUID(core_labels.id) AS 'Label UUID' FROM core_labels;

-- BOARD_LABELS TABLE UUIDs
SELECT BIN_TO_UUID(board_labels.id) AS 'Label UUID', users.first_name, users.last_name, users.username
FROM board_labels
INNER JOIN boards ON board_labels.board_id = boards.id
INNER JOIN users ON boards.user_id = users.id;

-- CARD_LABELS TABLE UUIDs
SELECT BIN_TO_UUID(card_labels.label_id) AS 'Label UUID', BIN_TO_UUID(card_labels.card_id) AS 'Card UUID', users.first_name, users.last_name, users.username
FROM card_labels
INNER JOIN cards ON card_labels.card_id = cards.id
INNER JOIN lists ON cards.list_id = lists.id
INNER JOIN boards ON lists.board_id = boards.id
INNER JOIN users ON boards.user_id = users.id;

-- ATTACHMENTS TABLE UUIDs
SELECT BIN_TO_UUID(attachments.id) AS 'Attachment UUID', users.first_name, users.last_name, users.username
FROM attachments
INNER JOIN users ON attachments.user_id = users.id;
