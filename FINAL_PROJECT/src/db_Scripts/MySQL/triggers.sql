-- UPDATE CARD'S DATE WHEN IT IS MODIFIED --
DELIMITER //

CREATE TRIGGER before_card_update
BEFORE UPDATE ON cards
FOR EACH ROW
BEGIN
    SET NEW.created_date = CURRENT_TIMESTAMP;
END; //

DELIMITER ;

-- MAINTAIN THE POSITION OF THE LISTS ON A BOARD WHEN A LIST IS DELETED --
DELIMITER //

CREATE TRIGGER after_list_delete
AFTER DELETE ON lists
FOR EACH ROW
BEGIN
    UPDATE lists
    SET position = position - 1
    WHERE board_id = OLD.board_id AND position > OLD.position;
END; //

DELIMITER ;

-- PREVENT DUPLICATE USERS FROM BEING ASSIGNED TO THE SAME CARD --
DELIMITER //

CREATE TRIGGER before_card_user_insert
BEFORE INSERT ON card_user
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM card_user WHERE card_id = NEW.card_id AND user_id = NEW.user_id) > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User already assigned to this card';
    END IF;
END; //

DELIMITER ;

-- MAINTAIN REFERENTIAL INTEGRITY WHEN DELETING A BOARD --

DELIMITER //

CREATE TRIGGER after_board_delete
AFTER DELETE ON boards
FOR EACH ROW
BEGIN
    DELETE FROM board_labels WHERE board_id = OLD.id;
END; //

DELIMITER ;

-- UPDATE THE STATUS OF A CHECKLIST THE STATUS OF ALL ITEMS IS CHANGED --
DELIMITER //

CREATE TRIGGER after_checklist_update
AFTER UPDATE ON checklists
FOR EACH ROW
BEGIN
    DECLARE checklist_complete BOOLEAN;
    SELECT CASE
        WHEN COUNT(*) = SUM(is_checked) THEN TRUE
        ELSE FALSE
    END INTO checklist_complete
    FROM checklists
    WHERE card_id = NEW.card_id;

    UPDATE cards
    SET is_active = NOT checklist_complete
    WHERE id = NEW.card_id;
END; //

DELIMITER ;
