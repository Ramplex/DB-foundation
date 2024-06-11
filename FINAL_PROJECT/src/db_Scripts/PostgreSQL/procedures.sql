-- CREATE A NEW USER --
CREATE OR REPLACE FUNCTION create_user (
    first_name VARCHAR,
    last_name VARCHAR,
    username VARCHAR,
    email_address VARCHAR,
    password VARCHAR
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO users (first_name, last_name, username, email_address, password)
    VALUES (first_name, last_name, username, email_address, password);
END;
$$ LANGUAGE plpgsql;

-- CREATE A NEW BOARD --
CREATE OR REPLACE FUNCTION create_board (
    user_id UUID,
    name VARCHAR,
    is_public BOOLEAN
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO boards (user_id, name, is_public)
    VALUES (user_id, name, is_public);
END;
$$ LANGUAGE plpgsql;

-- ADD A CARD TO A SPECIFIC LIST --
CREATE OR REPLACE FUNCTION add_card (
    list_id UUID,
    name VARCHAR,
    description TEXT,
    due_date DATE,
    reminder_date DATE
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO cards (list_id, name, description, due_date, reminder_date)
    VALUES (list_id, name, description, due_date, reminder_date);
END;
$$ LANGUAGE plpgsql;

-- ASSIGN A USER TO A CARD --
CREATE OR REPLACE FUNCTION assign_user_to_card (
    card_id UUID,
    user_id UUID
)
RETURNS VOID AS $$
BEGIN
    IF (SELECT COUNT(*) FROM card_user WHERE card_id = card_id AND user_id = user_id) = 0 THEN
        INSERT INTO card_user (card_id, user_id)
        VALUES (card_id, user_id);
    ELSE
        RAISE EXCEPTION 'User already assigned to this card';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- ADD A COMMENT TO A CARD --
CREATE OR REPLACE FUNCTION add_comment (
    card_id UUID,
    user_id UUID,
    content TEXT
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO comments (card_id, user_id, content)
    VALUES (card_id, user_id, content);
END;
$$ LANGUAGE plpgsql;

-- MARK A CHECKLIST AS COMPLETED --
CREATE OR REPLACE FUNCTION complete_checklist (
    checklist_id UUID
)
RETURNS VOID AS $$
BEGIN
    UPDATE checklists
    SET is_checked = TRUE
    WHERE id = checklist_id;
END;
$$ LANGUAGE plpgsql;

-- GET USER'S RECENT ACTIVITY --
CREATE OR REPLACE FUNCTION get_recent_activity_by_user (
    user_id UUID
)
RETURNS TABLE (
    activity TEXT,
    created_date TIMESTAMP,
    card_name VARCHAR,
    list_name VARCHAR,
    board_name VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT ca.activity, ca.created_date, c.name AS card_name, l.name AS list_name, b.name AS board_name
    FROM card_activity ca
    INNER JOIN cards c ON ca.card_id = c.id
    INNER JOIN lists l ON c.list_id = l.id
    INNER JOIN boards b ON l.board_id = b.id
    WHERE ca.user_id = user_id
    ORDER BY ca.created_date DESC;
END;
$$ LANGUAGE plpgsql;

-- GET ATTACHMENTS BY USER --
CREATE OR REPLACE FUNCTION get_attachments_by_user (
    user_uuid UUID
)
RETURNS TABLE (
    attachment_id UUID,
    filename VARCHAR,
    location VARCHAR,
    upload_date TIMESTAMP,
    card_id UUID
) AS $$
BEGIN
    RETURN QUERY
    SELECT id, filename, location, upload_date, card_id
    FROM attachments
    WHERE user_id = user_uuid
    ORDER BY upload_date DESC;
END;
$$ LANGUAGE plpgsql;

-- DELETE ATTACHMENT --
CREATE OR REPLACE FUNCTION delete_attachment (
    attachment_uuid UUID
)
RETURNS VOID AS $$
DECLARE
    file_location VARCHAR;
BEGIN
    -- GET THE FILE LOCATION
    SELECT location INTO file_location
    FROM attachments
    WHERE id = attachment_uuid;

    -- DELETE THE FILE FROM THE SYSTEM
    PERFORM delete_file(file_location);

    -- DELETE THE RECORD FROM THE DATABASE
    DELETE FROM attachments
    WHERE id = attachment_uuid;
END;
$$ LANGUAGE plpgsql;
