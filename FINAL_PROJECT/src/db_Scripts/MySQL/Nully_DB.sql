CREATE DATABASE IF NOT EXISTS Nully;
USE Nully;

-- USER TABLE --
CREATE TABLE users (
    id BINARY(16) PRIMARY KEY DEFAULT (UUID_TO_BIN(UUID())),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    username VARCHAR(20) NOT NULL UNIQUE,
    email_address VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    signup_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- BOARD TABLE --
CREATE TABLE boards (
    id BINARY(16) PRIMARY KEY DEFAULT (UUID_TO_BIN(UUID())),
    user_id BINARY(16) NOT NULL,
    name VARCHAR(255) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_public BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- LIST TABLE --
CREATE TABLE lists (
    id BINARY(16) PRIMARY KEY DEFAULT (UUID_TO_BIN(UUID())),
    board_id BINARY(16) NOT NULL,
    name VARCHAR(255) NOT NULL,
    position INT UNSIGNED NOT NULL,
    FOREIGN KEY (board_id) REFERENCES boards(id) ON DELETE CASCADE
);

-- CARD TABLE --
CREATE TABLE cards (
    id BINARY(16) PRIMARY KEY DEFAULT (UUID_TO_BIN(UUID())),
    list_id BINARY(16) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    due_date DATE,
    reminder_date DATE,
    FOREIGN KEY (list_id) REFERENCES lists(id) ON DELETE CASCADE
);

-- BOARDS MEMBERS TABLE --
CREATE TABLE board_user (
    board_id BINARY(16) NOT NULL,
    user_id BINARY(16) NOT NULL,
    PRIMARY KEY (board_id, user_id),
    FOREIGN KEY (board_id) REFERENCES boards(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- COMMENTS TABLE --
CREATE TABLE comments (
    id BINARY(16) PRIMARY KEY DEFAULT (UUID_TO_BIN(UUID())),
    card_id BINARY(16) NOT NULL,
    user_id BINARY(16) NOT NULL,
    content TEXT NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (card_id) REFERENCES cards(id) ON DELETE CASCADE
);

-- CHECKLIST TABLE --
CREATE TABLE checklists (
    id BINARY(16) PRIMARY KEY DEFAULT (UUID_TO_BIN(UUID())),
    card_id BINARY(16) NOT NULL,
    name VARCHAR(255) NOT NULL,
    is_checked BOOLEAN DEFAULT FALSE,
    position INT UNSIGNED NOT NULL,
    FOREIGN KEY (card_id) REFERENCES cards(id) ON DELETE CASCADE
);

-- CARDS MEMBERS TABLE --
CREATE TABLE card_user (
    card_id BINARY(16) NOT NULL,
    user_id BINARY(16) NOT NULL,
    PRIMARY KEY (card_id, user_id),
    FOREIGN KEY (card_id) REFERENCES cards(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- CARD ACTIVITIES TABLE
CREATE TABLE card_activity (
    id BINARY(16) PRIMARY KEY DEFAULT (UUID_TO_BIN(UUID())),
    card_id BINARY(16) NOT NULL,
    user_id BINARY(16) NOT NULL,
    activity VARCHAR(255) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (card_id) REFERENCES cards(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- GENERAL LABELS TABLE
CREATE TABLE core_labels (
    id BINARY(16) PRIMARY KEY DEFAULT (UUID_TO_BIN(UUID())),
    name VARCHAR(255) NOT NULL,
    color VARCHAR(7) NOT NULL
);

-- LABELS BY BOARD --
CREATE TABLE board_labels (
    id BINARY(16) PRIMARY KEY DEFAULT (UUID_TO_BIN(UUID())),
    board_id BINARY(16) NOT NULL,
    name VARCHAR(255) NOT NULL,
    color VARCHAR(7) NOT NULL,
    FOREIGN KEY (board_id) REFERENCES boards(id) ON DELETE CASCADE
);

-- LABELS BY CARD --
CREATE TABLE card_labels (
    label_id BINARY(16) NOT NULL,
    card_id BINARY(16) NOT NULL,
    PRIMARY KEY (label_id, card_id),
    FOREIGN KEY (label_id) REFERENCES core_labels(id) ON DELETE CASCADE,
    FOREIGN KEY (card_id) REFERENCES cards(id) ON DELETE CASCADE
);

-- ATTACHMENTS TABLE --
CREATE TABLE attachments (
    id BINARY(16) PRIMARY KEY DEFAULT (UUID_TO_BIN(UUID())),
    card_id BINARY(16) NOT NULL,
    user_id BINARY(16) NOT NULL,
    upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    filename VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    FOREIGN KEY (card_id) REFERENCES cards(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Indexes --
CREATE INDEX idx_users_email ON users (email_address);
CREATE INDEX idx_boards_user ON boards (user_id);
CREATE INDEX idx_boards_name ON boards (name);
CREATE INDEX idx_lists_board ON lists (board_id);
CREATE INDEX idx_cards_list ON cards (list_id);
CREATE INDEX idx_cards_name ON cards (name);
CREATE INDEX idx_comments_card ON comments (card_id);
CREATE INDEX idx_comments_user ON comments (user_id);
CREATE INDEX idx_checklists_card ON checklists (card_id);
CREATE INDEX idx_card_user_user ON card_user (user_id);
CREATE INDEX idx_card_activity_card ON card_activity (card_id);
CREATE INDEX idx_card_activity_user ON card_activity (user_id);
CREATE INDEX idx_attachments_card ON attachments (card_id);
CREATE INDEX idx_attachments_user ON attachments (user_id);
CREATE INDEX idx_attachments_filename ON attachments (filename);