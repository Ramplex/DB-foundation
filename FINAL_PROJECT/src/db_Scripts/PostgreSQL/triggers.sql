-- UPDATE CARD'S DATE WHEN IT IS MODIFIED --
CREATE OR REPLACE FUNCTION update_card_date()
RETURNS TRIGGER AS $$
BEGIN
    NEW.created_date = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_card_update
BEFORE UPDATE ON cards
FOR EACH ROW
EXECUTE FUNCTION update_card_date();

-- MAINTAIN THE POSITION OF THE LISTS ON A BOARD WHEN A LIST IS DELETED --
CREATE OR REPLACE FUNCTION maintain_list_position()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE lists
    SET position = position - 1
    WHERE board_id = OLD.board_id AND position > OLD.position;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_list_delete
AFTER DELETE ON lists
FOR EACH ROW
EXECUTE FUNCTION maintain_list_position();

-- PREVENT DUPLICATE USERS FROM BEING ASSIGNED TO THE SAME CARD --
CREATE OR REPLACE FUNCTION prevent_duplicate_card_user()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT COUNT(*) FROM card_user WHERE card_id = NEW.card_id AND user_id = NEW.user_id) > 0 THEN
        RAISE EXCEPTION 'User already assigned to this card';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_card_user_insert
BEFORE INSERT ON card_user
FOR EACH ROW
EXECUTE FUNCTION prevent_duplicate_card_user();

-- MAINTAIN REFERENTIAL INTEGRITY WHEN DELETING A BOARD --
CREATE OR REPLACE FUNCTION maintain_referential_integrity()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM board_labels WHERE board_id = OLD.id;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_board_delete
AFTER DELETE ON boards
FOR EACH ROW
EXECUTE FUNCTION maintain_referential_integrity();

-- UPDATE THE STATUS OF A CHECKLIST THE STATUS OF ALL ITEMS IS CHANGED --
CREATE OR REPLACE FUNCTION update_checklist_status()
RETURNS TRIGGER AS $$
DECLARE
    checklist_complete BOOLEAN;
BEGIN
    SELECT CASE
        WHEN COUNT(*) = SUM(is_checked::int) THEN TRUE
        ELSE FALSE
    END INTO checklist_complete
    FROM checklists
    WHERE card_id = NEW.card_id;

    UPDATE cards
    SET is_active = NOT checklist_complete
    WHERE id = NEW.card_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_checklist_update
AFTER UPDATE ON checklists
FOR EACH ROW
EXECUTE FUNCTION update_checklist_status();
