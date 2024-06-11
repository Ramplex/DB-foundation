-- CREATE A NEW USER --
DELIMITER //

CREATE PROCEDURE create_user (
    IN first_name VARCHAR(100),
    IN last_name VARCHAR(100),
    IN username VARCHAR(20),
    IN email_address VARCHAR(100),
    IN password VARCHAR(255)
)
BEGIN
    INSERT INTO users (first_name, last_name, username, email_address, password)
    VALUES (first_name, last_name, username, email_address, password);
END; //

DELIMITER ;

-- CREATE A NEW BOARD --
DELIMITER //

CREATE PROCEDURE create_board (
    IN user_id BINARY(16),
    IN name VARCHAR(255),
    IN is_public BOOLEAN
)
BEGIN
    INSERT INTO boards (user_id, name, is_public)
    VALUES (user_id, name, is_public);
END; //

DELIMITER ;

-- ADD A CARD TO A SPECIFIC LIST --
DELIMITER //

CREATE PROCEDURE add_card (
    IN list_id BINARY(16),
    IN name VARCHAR(255),
    IN description TEXT,
    IN due_date DATE,
    IN reminder_date DATE
)
BEGIN
    INSERT INTO cards (list_id, name, description, due_date, reminder_date)
    VALUES (list_id, name, description, due_date, reminder_date);
END; //

DELIMITER ;

-- ASSIGN A USER TO A CARD --
DELIMITER //

CREATE PROCEDURE assign_user_to_card (
    IN card_id BINARY(16),
    IN user_id BINARY(16)
)
BEGIN
    IF (SELECT COUNT(*) FROM card_user WHERE card_id = card_id AND user_id = user_id) = 0 THEN
        INSERT INTO card_user (card_id, user_id)
        VALUES (card_id, user_id);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User already assigned to this card';
    END IF;
END; //

DELIMITER ;

-- ADD A COMMENT TO A CARD --
DELIMITER //

CREATE PROCEDURE add_comment (
    IN card_id BINARY(16),
    IN user_id BINARY(16),
    IN content TEXT
)
BEGIN
    INSERT INTO comments (card_id, user_id, content)
    VALUES (card_id, user_id, content);
END; //

DELIMITER ;

-- MARK A CHECKLIST AS COMPLETED --
DELIMITER //

CREATE PROCEDURE complete_checklist (
    IN checklist_id BINARY(16)
)
BEGIN
    UPDATE checklists
    SET is_checked = TRUE
    WHERE id = checklist_id;
END; //

DELIMITER ;

-- GET USER'S RECENT ACTIVITY --
DELIMITER //

CREATE PROCEDURE get_recent_activity_by_user (
    IN user_id BINARY(16)
)
BEGIN
    SELECT ca.activity, ca.created_date, c.name AS card_name, l.name AS list_name, b.name AS board_name
    FROM card_activity ca
    INNER JOIN cards c ON ca.card_id = c.id
    INNER JOIN lists l ON c.list_id = l.id
    INNER JOIN boards b ON l.board_id = b.id
    WHERE ca.user_id = user_id
    ORDER BY ca.created_date DESC;
END; //

DELIMITER ;

-- GET ATTACHMENTS BY USER --

DELIMITER //

CREATE PROCEDURE get_attachments_by_user (
    IN user_uuid BINARY(16)
)
BEGIN
    SELECT BIN_TO_UUID(id) AS attachment_id, filename, location, upload_date, BIN_TO_UUID(card_id) AS card_id
    FROM attachments
    WHERE user_id = user_uuid
    ORDER BY upload_date DESC;
END; //

DELIMITER ;

-- DELETE ATTACHMENT --
DELIMITER //

CREATE PROCEDURE delete_attachment (
    IN attachment_uuid BINARY(16)
)
BEGIN
    DECLARE file_location VARCHAR(255);

    -- GET THE FILE LOCATION
    SELECT location INTO file_location
    FROM attachments
    WHERE id = attachment_uuid;

    -- DELETE THE FILE FROM THE SYSTEM
    CALL delete_file(file_location);

    -- DELETE THE RECORD FROM THE DATABASE
    DELETE FROM attachments
    WHERE id = attachment_uuid;
END; //

DELIMITER ;
