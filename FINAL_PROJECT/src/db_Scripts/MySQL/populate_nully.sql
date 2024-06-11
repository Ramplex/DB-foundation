USE Nully;

-- USERS --
INSERT INTO users (first_name, last_name, username, email_address, password, signup_date) VALUES
('John', 'Doe', 'johndoe', 'john.doe@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-01 10:00:00'),
('Jane', 'Smith', 'janesmith', 'jane.smith@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-02 10:00:00'),
('Michael', 'Johnson', 'michaelj', 'michael.johnson@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-03 10:00:00'),
('Emily', 'Williams', 'emilyw', 'emily.williams@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-04 10:00:00'),
('Chris', 'Brown', 'chrisb', 'chris.brown@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-05 10:00:00'),
('Sarah', 'Jones', 'sarahj', 'sarah.jones@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-06 10:00:00'),
('Matthew', 'Garcia', 'matthewg', 'matthew.garcia@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-07 10:00:00'),
('Jessica', 'Martinez', 'jessicam', 'jessica.martinez@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-08 10:00:00'),
('David', 'Rodriguez', 'davidr', 'david.rodriguez@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-09 10:00:00'),
('Laura', 'Hernandez', 'laurah', 'laura.hernandez@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-10 10:00:00'),
('Daniel', 'Lopez', 'daniell', 'daniel.lopez@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-11 10:00:00'),
('Sophia', 'Gonzalez', 'sophiag', 'sophia.gonzalez@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-12 10:00:00'),
('James', 'Wilson', 'jamesw', 'james.wilson@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-13 10:00:00'),
('Olivia', 'Anderson', 'oliviaa', 'olivia.anderson@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-14 10:00:00'),
('Joshua', 'Thomas', 'joshuat', 'joshua.thomas@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-15 10:00:00'),
('Isabella', 'Taylor', 'isabellat', 'isabella.taylor@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-16 10:00:00'),
('Andrew', 'Moore', 'andrewm', 'andrew.moore@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-17 10:00:00'),
('Mia', 'Jackson', 'miaj', 'mia.jackson@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-18 10:00:00'),
('Joseph', 'Martin', 'josephm', 'joseph.martin@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-19 10:00:00'),
('Amelia', 'Lee', 'amelial', 'amelia.lee@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-20 10:00:00'),
('Ethan', 'Perez', 'ethanp', 'ethan.perez@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-21 10:00:00'),
('Charlotte', 'White', 'charlottew', 'charlotte.white@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-22 10:00:00'),
('Alexander', 'Harris', 'alexanderh', 'alexander.harris@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-23 10:00:00'),
('Abigail', 'Sanchez', 'abigails', 'abigail.sanchez@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-24 10:00:00'),
('Aiden', 'Clark', 'aidenc', 'aiden.clark@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-25 10:00:00'),
('Ava', 'Ramirez', 'avar', 'ava.ramirez@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-26 10:00:00'),
('William', 'Lewis', 'williaml', 'william.lewis@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-27 10:00:00'),
('Sofia', 'Robinson', 'sofiar', 'sofia.robinson@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-28 10:00:00'),
('Elijah', 'Walker', 'elijahw', 'elijah.walker@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-29 10:00:00'),
('Madison', 'Young', 'madisony', 'madison.young@example.com', '$2y$10$abcdefghijklmnopqrstuv', '2024-01-30 10:00:00');

-- BOARDS --
INSERT INTO boards (user_id, name, created_date, is_public)
SELECT id, CONCAT('Project Management for ', first_name), '2024-02-01 10:00:00', FALSE FROM users WHERE username = 'johndoe' UNION ALL
SELECT id, CONCAT('Team Collaboration for ', first_name), '2024-02-02 11:00:00', TRUE FROM users WHERE username = 'janesmith' UNION ALL
SELECT id, CONCAT('Marketing Plan for ', first_name), '2024-02-03 12:00:00', FALSE FROM users WHERE username = 'michaelj' UNION ALL
SELECT id, CONCAT('Product Launch for ', first_name), '2024-02-04 13:00:00', TRUE FROM users WHERE username = 'emilyw' UNION ALL
SELECT id, CONCAT('Development Sprint for ', first_name), '2024-02-05 14:00:00', FALSE FROM users WHERE username = 'chrisb' UNION ALL
SELECT id, CONCAT('Client Onboarding for ', first_name), '2024-02-06 15:00:00', TRUE FROM users WHERE username = 'sarahj' UNION ALL
SELECT id, CONCAT('Q1 Goals for ', first_name), '2024-02-07 16:00:00', FALSE FROM users WHERE username = 'matthewg' UNION ALL
SELECT id, CONCAT('Sales Pipeline for ', first_name), '2024-02-08 17:00:00', TRUE FROM users WHERE username = 'jessicam' UNION ALL
SELECT id, CONCAT('Research and Development for ', first_name), '2024-02-09 18:00:00', FALSE FROM users WHERE username = 'davidr' UNION ALL
SELECT id, CONCAT('Content Calendar for ', first_name), '2024-02-10 19:00:00', TRUE FROM users WHERE username = 'laurah' UNION ALL
SELECT id, CONCAT('Event Planning for ', first_name), '2024-02-11 20:00:00', FALSE FROM users WHERE username = 'daniell' UNION ALL
SELECT id, CONCAT('Budget Tracking for ', first_name), '2024-02-12 21:00:00', TRUE FROM users WHERE username = 'sophiag' UNION ALL
SELECT id, CONCAT('HR Management for ', first_name), '2024-02-13 22:00:00', FALSE FROM users WHERE username = 'jamesw' UNION ALL
SELECT id, CONCAT('Customer Support for ', first_name), '2024-02-14 23:00:00', TRUE FROM users WHERE username = 'oliviaa' UNION ALL
SELECT id, CONCAT('Social Media Strategy for ', first_name), '2024-02-15 10:00:00', FALSE FROM users WHERE username = 'joshuat' UNION ALL
SELECT id, CONCAT('Website Redesign for ', first_name), '2024-02-16 11:00:00', TRUE FROM users WHERE username = 'isabellat' UNION ALL
SELECT id, CONCAT('New Feature Development for ', first_name), '2024-02-17 12:00:00', FALSE FROM users WHERE username = 'andrewm' UNION ALL
SELECT id, CONCAT('User Research for ', first_name), '2024-02-18 13:00:00', TRUE FROM users WHERE username = 'miaj' UNION ALL
SELECT id, CONCAT('PR Campaign for ', first_name), '2024-02-19 14:00:00', FALSE FROM users WHERE username = 'josephm' UNION ALL
SELECT id, CONCAT('Compliance Audit for ', first_name), '2024-02-20 15:00:00', TRUE FROM users WHERE username = 'amelial' UNION ALL
SELECT id, CONCAT('Supply Chain Management for ', first_name), '2024-02-21 16:00:00', FALSE FROM users WHERE username = 'ethanp' UNION ALL
SELECT id, CONCAT('SEO Optimization for ', first_name), '2024-02-22 17:00:00', TRUE FROM users WHERE username = 'charlottew' UNION ALL
SELECT id, CONCAT('Competitive Analysis for ', first_name), '2024-02-23 18:00:00', FALSE FROM users WHERE username = 'alexanderh' UNION ALL
SELECT id, CONCAT('Legal Review for ', first_name), '2024-02-24 19:00:00', TRUE FROM users WHERE username = 'abigails' UNION ALL
SELECT id, CONCAT('Team Building for ', first_name), '2024-02-25 20:00:00', FALSE FROM users WHERE username = 'aidenc' UNION ALL
SELECT id, CONCAT('Product Feedback for ', first_name), '2024-02-26 21:00:00', TRUE FROM users WHERE username = 'avar' UNION ALL
SELECT id, CONCAT('Customer Interviews for ', first_name), '2024-02-27 22:00:00', FALSE FROM users WHERE username = 'williaml' UNION ALL
SELECT id, CONCAT('Market Research for ', first_name), '2024-02-28 23:00:00', TRUE FROM users WHERE username = 'sofiar' UNION ALL
SELECT id, CONCAT('Fundraising for ', first_name), '2024-03-01 10:00:00', FALSE FROM users WHERE username = 'elijahw' UNION ALL
SELECT id, CONCAT('Investor Relations for ', first_name), '2024-03-02 11:00:00', TRUE FROM users WHERE username = 'madisony';

-- LISTS --
INSERT INTO lists (board_id, name, position)
SELECT id, 'To Do', 1 FROM boards WHERE name LIKE 'Project Management for %' UNION ALL
SELECT id, 'In Progress', 2 FROM boards WHERE name LIKE 'Project Management for %' UNION ALL
SELECT id, 'Done', 3 FROM boards WHERE name LIKE 'Project Management for %' UNION ALL

SELECT id, 'Backlog', 1 FROM boards WHERE name LIKE 'Team Collaboration for %' UNION ALL
SELECT id, 'Sprint Planning', 2 FROM boards WHERE name LIKE 'Team Collaboration for %' UNION ALL
SELECT id, 'Review', 3 FROM boards WHERE name LIKE 'Team Collaboration for %' UNION ALL

SELECT id, 'Ideas', 1 FROM boards WHERE name LIKE 'Marketing Plan for %' UNION ALL
SELECT id, 'In Development', 2 FROM boards WHERE name LIKE 'Marketing Plan for %' UNION ALL
SELECT id, 'Published', 3 FROM boards WHERE name LIKE 'Marketing Plan for %' UNION ALL

SELECT id, 'Tasks', 1 FROM boards WHERE name LIKE 'Product Launch for %' UNION ALL
SELECT id, 'In Review', 2 FROM boards WHERE name LIKE 'Product Launch for %' UNION ALL
SELECT id, 'Completed', 3 FROM boards WHERE name LIKE 'Product Launch for %' UNION ALL

SELECT id, 'Requirements', 1 FROM boards WHERE name LIKE 'Development Sprint for %' UNION ALL
SELECT id, 'Development', 2 FROM boards WHERE name LIKE 'Development Sprint for %' UNION ALL
SELECT id, 'Testing', 3 FROM boards WHERE name LIKE 'Development Sprint for %' UNION ALL

SELECT id, 'Onboarding Tasks', 1 FROM boards WHERE name LIKE 'Client Onboarding for %' UNION ALL
SELECT id, 'In Progress', 2 FROM boards WHERE name LIKE 'Client Onboarding for %' UNION ALL
SELECT id, 'Completed', 3 FROM boards WHERE name LIKE 'Client Onboarding for %' UNION ALL

SELECT id, 'Q1 Goals', 1 FROM boards WHERE name LIKE 'Q1 Goals for %' UNION ALL
SELECT id, 'Q2 Goals', 2 FROM boards WHERE name LIKE 'Q1 Goals for %' UNION ALL
SELECT id, 'Q3 Goals', 3 FROM boards WHERE name LIKE 'Q1 Goals for %' UNION ALL

SELECT id, 'Leads', 1 FROM boards WHERE name LIKE 'Sales Pipeline for %' UNION ALL
SELECT id, 'Prospects', 2 FROM boards WHERE name LIKE 'Sales Pipeline for %' UNION ALL
SELECT id, 'Closed Deals', 3 FROM boards WHERE name LIKE 'Sales Pipeline for %' UNION ALL

SELECT id, 'Research Topics', 1 FROM boards WHERE name LIKE 'Research and Development for %' UNION ALL
SELECT id, 'Experiments', 2 FROM boards WHERE name LIKE 'Research and Development for %' UNION ALL
SELECT id, 'Results', 3 FROM boards WHERE name LIKE 'Research and Development for %' UNION ALL

SELECT id, 'Content Ideas', 1 FROM boards WHERE name LIKE 'Content Calendar for %' UNION ALL
SELECT id, 'Drafts', 2 FROM boards WHERE name LIKE 'Content Calendar for %' UNION ALL
SELECT id, 'Published Content', 3 FROM boards WHERE name LIKE 'Content Calendar for %' UNION ALL

SELECT id, 'Event Tasks', 1 FROM boards WHERE name LIKE 'Event Planning for %' UNION ALL
SELECT id, 'In Progress', 2 FROM boards WHERE name LIKE 'Event Planning for %' UNION ALL
SELECT id, 'Completed', 3 FROM boards WHERE name LIKE 'Event Planning for %' UNION ALL

SELECT id, 'Budget Items', 1 FROM boards WHERE name LIKE 'Budget Tracking for %' UNION ALL
SELECT id, 'In Review', 2 FROM boards WHERE name LIKE 'Budget Tracking for %' UNION ALL
SELECT id, 'Approved', 3 FROM boards WHERE name LIKE 'Budget Tracking for %' UNION ALL

SELECT id, 'HR Tasks', 1 FROM boards WHERE name LIKE 'HR Management for %' UNION ALL
SELECT id, 'In Progress', 2 FROM boards WHERE name LIKE 'HR Management for %' UNION ALL
SELECT id, 'Completed', 3 FROM boards WHERE name LIKE 'HR Management for %' UNION ALL

SELECT id, 'Support Tickets', 1 FROM boards WHERE name LIKE 'Customer Support for %' UNION ALL
SELECT id, 'In Progress', 2 FROM boards WHERE name LIKE 'Customer Support for %' UNION ALL
SELECT id, 'Resolved', 3 FROM boards WHERE name LIKE 'Customer Support for %' UNION ALL

SELECT id, 'Social Media Posts', 1 FROM boards WHERE name LIKE 'Social Media Strategy for %' UNION ALL
SELECT id, 'Scheduled Posts', 2 FROM boards WHERE name LIKE 'Social Media Strategy for %' UNION ALL
SELECT id, 'Published Posts', 3 FROM boards WHERE name LIKE 'Social Media Strategy for %' UNION ALL

SELECT id, 'Website Redesign Tasks', 1 FROM boards WHERE name LIKE 'Website Redesign for %' UNION ALL
SELECT id, 'In Progress', 2 FROM boards WHERE name LIKE 'Website Redesign for %' UNION ALL
SELECT id, 'Completed', 3 FROM boards WHERE name LIKE 'Website Redesign for %' UNION ALL

SELECT id, 'New Feature Ideas', 1 FROM boards WHERE name LIKE 'New Feature Development for %' UNION ALL
SELECT id, 'In Development', 2 FROM boards WHERE name LIKE 'New Feature Development for %' UNION ALL
SELECT id, 'Released Features', 3 FROM boards WHERE name LIKE 'New Feature Development for %' UNION ALL

SELECT id, 'User Research Tasks', 1 FROM boards WHERE name LIKE 'User Research for %' UNION ALL
SELECT id, 'In Progress', 2 FROM boards WHERE name LIKE 'User Research for %' UNION ALL
SELECT id, 'Completed', 3 FROM boards WHERE name LIKE 'User Research for %' UNION ALL

SELECT id, 'PR Tasks', 1 FROM boards WHERE name LIKE 'PR Campaign for %' UNION ALL
SELECT id, 'In Progress', 2 FROM boards WHERE name LIKE 'PR Campaign for %' UNION ALL
SELECT id, 'Completed', 3 FROM boards WHERE name LIKE 'PR Campaign for %' UNION ALL

SELECT id, 'Audit Tasks', 1 FROM boards WHERE name LIKE 'Compliance Audit for %' UNION ALL
SELECT id, 'In Review', 2 FROM boards WHERE name LIKE 'Compliance Audit for %' UNION ALL
SELECT id, 'Completed', 3 FROM boards WHERE name LIKE 'Compliance Audit for %' UNION ALL

SELECT id, 'Supply Chain Tasks', 1 FROM boards WHERE name LIKE 'Supply Chain Management for %' UNION ALL
SELECT id, 'In Progress', 2 FROM boards WHERE name LIKE 'Supply Chain Management for %' UNION ALL
SELECT id, 'Completed', 3 FROM boards WHERE name LIKE 'Supply Chain Management for %' UNION ALL

SELECT id, 'SEO Tasks', 1 FROM boards WHERE name LIKE 'SEO Optimization for %' UNION ALL
SELECT id, 'In Progress', 2 FROM boards WHERE name LIKE 'SEO Optimization for %' UNION ALL
SELECT id, 'Completed', 3 FROM boards WHERE name LIKE 'SEO Optimization for %' UNION ALL

SELECT id, 'Analysis Tasks', 1 FROM boards WHERE name LIKE 'Competitive Analysis for %' UNION ALL
SELECT id, 'In Progress', 2 FROM boards WHERE name LIKE 'Competitive Analysis for %' UNION ALL
SELECT id, 'Completed', 3 FROM boards WHERE name LIKE 'Competitive Analysis for %' UNION ALL

SELECT id, 'Legal Review Tasks', 1 FROM boards WHERE name LIKE 'Legal Review for %' UNION ALL
SELECT id, 'In Progress', 2 FROM boards WHERE name LIKE 'Legal Review for %' UNION ALL
SELECT id, 'Completed', 3 FROM boards WHERE name LIKE 'Legal Review for %' UNION ALL

SELECT id, 'Team Building Tasks', 1 FROM boards WHERE name LIKE 'Team Building for %' UNION ALL
SELECT id, 'In Progress', 2 FROM boards WHERE name LIKE 'Team Building for %' UNION ALL
SELECT id, 'Completed', 3 FROM boards WHERE name LIKE 'Team Building for %' UNION ALL

SELECT id, 'Product Feedback Tasks', 1 FROM boards WHERE name LIKE 'Product Feedback for %' UNION ALL
SELECT id, 'In Progress', 2 FROM boards WHERE name LIKE 'Product Feedback for %' UNION ALL
SELECT id, 'Completed', 3 FROM boards WHERE name LIKE 'Product Feedback for %' UNION ALL

SELECT id, 'Customer Interview Tasks', 1 FROM boards WHERE name LIKE 'Customer Interviews for %' UNION ALL
SELECT id, 'In Progress', 2 FROM boards WHERE name LIKE 'Customer Interviews for %' UNION ALL
SELECT id, 'Completed', 3 FROM boards WHERE name LIKE 'Customer Interviews for %' UNION ALL

SELECT id, 'Market Research Tasks', 1 FROM boards WHERE name LIKE 'Market Research for %' UNION ALL
SELECT id, 'In Progress', 2 FROM boards WHERE name LIKE 'Market Research for %' UNION ALL
SELECT id, 'Completed', 3 FROM boards WHERE name LIKE 'Market Research for %' UNION ALL

SELECT id, 'Fundraising Tasks', 1 FROM boards WHERE name LIKE 'Fundraising for %' UNION ALL
SELECT id, 'In Progress', 2 FROM boards WHERE name LIKE 'Fundraising for %' UNION ALL
SELECT id, 'Completed', 3 FROM boards WHERE name LIKE 'Fundraising for %' UNION ALL

SELECT id, 'Investor Relations Tasks', 1 FROM boards WHERE name LIKE 'Investor Relations for %' UNION ALL
SELECT id, 'In Progress', 2 FROM boards WHERE name LIKE 'Investor Relations for %' UNION ALL
SELECT id, 'Completed', 3 FROM boards WHERE name LIKE 'Investor Relations for %';

-- CARDS --
INSERT INTO cards (list_id, name, description, created_date, is_active, due_date, reminder_date)
SELECT id, 'Task 1', 'Description for Task 1', '2024-03-01 10:00:00', TRUE, '2024-03-15', '2024-03-10' FROM lists WHERE name = 'To Do' UNION ALL
SELECT id, 'Task 2', 'Description for Task 2', '2024-03-02 11:00:00', TRUE, '2024-03-16', '2024-03-11' FROM lists WHERE name = 'To Do' UNION ALL
SELECT id, 'Task 3', 'Description for Task 3', '2024-03-03 12:00:00', TRUE, '2024-03-17', '2024-03-12' FROM lists WHERE name = 'To Do' UNION ALL
SELECT id, 'Task 4', 'Description for Task 4', '2024-03-04 13:00:00', TRUE, '2024-03-18', '2024-03-13' FROM lists WHERE name = 'To Do' UNION ALL

SELECT id, 'In Progress Task 1', 'Description for In Progress Task 1', '2024-03-05 14:00:00', TRUE, '2024-03-19', '2024-03-14' FROM lists WHERE name = 'In Progress' UNION ALL
SELECT id, 'In Progress Task 2', 'Description for In Progress Task 2', '2024-03-06 15:00:00', TRUE, '2024-03-20', '2024-03-15' FROM lists WHERE name = 'In Progress' UNION ALL
SELECT id, 'In Progress Task 3', 'Description for In Progress Task 3', '2024-03-07 16:00:00', TRUE, '2024-03-21', '2024-03-16' FROM lists WHERE name = 'In Progress' UNION ALL

SELECT id, 'Done Task 1', 'Description for Done Task 1', '2024-03-08 17:00:00', FALSE, '2024-03-22', '2024-03-17' FROM lists WHERE name = 'Done' UNION ALL
SELECT id, 'Done Task 2', 'Description for Done Task 2', '2024-03-09 18:00:00', FALSE, '2024-03-23', '2024-03-18' FROM lists WHERE name = 'Done' UNION ALL
SELECT id, 'Done Task 3', 'Description for Done Task 3', '2024-03-10 19:00:00', FALSE, '2024-03-24', '2024-03-19' FROM lists WHERE name = 'Done' UNION ALL

SELECT id, 'Backlog Task 1', 'Description for Backlog Task 1', '2024-03-11 20:00:00', TRUE, '2024-03-25', '2024-03-20' FROM lists WHERE name = 'Backlog' UNION ALL
SELECT id, 'Backlog Task 2', 'Description for Backlog Task 2', '2024-03-12 21:00:00', TRUE, '2024-03-26', '2024-03-21' FROM lists WHERE name = 'Backlog' UNION ALL
SELECT id, 'Backlog Task 3', 'Description for Backlog Task 3', '2024-03-13 22:00:00', TRUE, '2024-03-27', '2024-03-22' FROM lists WHERE name = 'Backlog' UNION ALL

SELECT id, 'Sprint Planning Task 1', 'Description for Sprint Planning Task 1', '2024-03-14 23:00:00', TRUE, '2024-03-28', '2024-03-23' FROM lists WHERE name = 'Sprint Planning' UNION ALL
SELECT id, 'Sprint Planning Task 2', 'Description for Sprint Planning Task 2', '2024-03-15 10:00:00', TRUE, '2024-03-29', '2024-03-24' FROM lists WHERE name = 'Sprint Planning' UNION ALL
SELECT id, 'Sprint Planning Task 3', 'Description for Sprint Planning Task 3', '2024-03-16 11:00:00', TRUE, '2024-03-30', '2024-03-25' FROM lists WHERE name = 'Sprint Planning' UNION ALL

SELECT id, 'Review Task 1', 'Description for Review Task 1', '2024-03-17 12:00:00', TRUE, '2024-03-31', '2024-03-26' FROM lists WHERE name = 'Review' UNION ALL
SELECT id, 'Review Task 2', 'Description for Review Task 2', '2024-03-18 13:00:00', TRUE, '2024-04-01', '2024-03-27' FROM lists WHERE name = 'Review' UNION ALL
SELECT id, 'Review Task 3', 'Description for Review Task 3', '2024-03-19 14:00:00', TRUE, '2024-04-02', '2024-03-28' FROM lists WHERE name = 'Review' UNION ALL

SELECT id, 'Ideas Task 1', 'Description for Ideas Task 1', '2024-03-20 15:00:00', TRUE, '2024-04-03', '2024-03-29' FROM lists WHERE name = 'Ideas' UNION ALL
SELECT id, 'Ideas Task 2', 'Description for Ideas Task 2', '2024-03-21 16:00:00', TRUE, '2024-04-04', '2024-03-30' FROM lists WHERE name = 'Ideas' UNION ALL
SELECT id, 'Ideas Task 3', 'Description for Ideas Task 3', '2024-03-22 17:00:00', TRUE, '2024-04-05', '2024-03-31' FROM lists WHERE name = 'Ideas' UNION ALL

SELECT id, 'In Development Task 1', 'Description for In Development Task 1', '2024-03-23 18:00:00', TRUE, '2024-04-06', '2024-04-01' FROM lists WHERE name = 'In Development' UNION ALL
SELECT id, 'In Development Task 2', 'Description for In Development Task 2', '2024-03-24 19:00:00', TRUE, '2024-04-07', '2024-04-02' FROM lists WHERE name = 'In Development' UNION ALL
SELECT id, 'In Development Task 3', 'Description for In Development Task 3', '2024-03-25 20:00:00', TRUE, '2024-04-08', '2024-04-03' FROM lists WHERE name = 'In Development' UNION ALL

SELECT id, 'Published Task 1', 'Description for Published Task 1', '2024-03-26 21:00:00', FALSE, '2024-04-09', '2024-04-04' FROM lists WHERE name = 'Published' UNION ALL
SELECT id, 'Published Task 2', 'Description for Published Task 2', '2024-03-27 22:00:00', FALSE, '2024-04-10', '2024-04-05' FROM lists WHERE name = 'Published' UNION ALL
SELECT id, 'Published Task 3', 'Description for Published Task 3', '2024-03-28 23:00:00', FALSE, '2024-04-11', '2024-04-06' FROM lists WHERE name = 'Published' UNION ALL

SELECT id, 'Tasks Task 1', 'Description for Tasks Task 1', '2024-03-29 10:00:00', TRUE, '2024-04-12', '2024-04-07' FROM lists WHERE name = 'Tasks' UNION ALL
SELECT id, 'Tasks Task 2', 'Description for Tasks Task 2', '2024-03-30 11:00:00', TRUE, '2024-04-13', '2024-04-08' FROM lists WHERE name = 'Tasks' UNION ALL
SELECT id, 'Tasks Task 3', 'Description for Tasks Task 3', '2024-03-31 12:00:00', TRUE, '2024-04-14', '2024-04-09' FROM lists WHERE name = 'Tasks' UNION ALL

SELECT id, 'In Review Task 1', 'Description for In Review Task 1', '2024-04-01 13:00:00', TRUE, '2024-04-15', '2024-04-10' FROM lists WHERE name = 'In Review' UNION ALL
SELECT id, 'In Review Task 2', 'Description for In Review Task 2', '2024-04-02 14:00:00', TRUE, '2024-04-16', '2024-04-11' FROM lists WHERE name = 'In Review' UNION ALL
SELECT id, 'In Review Task 3', 'Description for In Review Task 3', '2024-04-03 15:00:00', TRUE, '2024-04-17', '2024-04-12' FROM lists WHERE name = 'In Review' UNION ALL

SELECT id, 'Completed Task 1', 'Description for Completed Task 1', '2024-04-04 16:00:00', FALSE, '2024-04-18', '2024-04-13' FROM lists WHERE name = 'Completed' UNION ALL
SELECT id, 'Completed Task 2', 'Description for Completed Task 2', '2024-04-05 17:00:00', FALSE, '2024-04-19', '2024-04-14' FROM lists WHERE name = 'Completed' UNION ALL
SELECT id, 'Completed Task 3', 'Description for Completed Task 3', '2024-04-06 18:00:00', FALSE, '2024-04-20', '2024-04-15' FROM lists WHERE name = 'Completed';

-- BOARD MEMBERS --
INSERT INTO board_user (board_id, user_id)
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name LIKE CONCAT('%', u.first_name, '%')
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Project Management for %' AND u.username = 'janesmith'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Team Collaboration for %' AND u.username = 'johndoe'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Marketing Plan for %' AND u.username = 'emilyw'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Product Launch for %' AND u.username = 'michaelj'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Development Sprint for %' AND u.username = 'sarahj'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Client Onboarding for %' AND u.username = 'chrisb'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Q1 Goals for %' AND u.username = 'matthewg'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Sales Pipeline for %' AND u.username = 'jessicam'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Research and Development for %' AND u.username = 'davidr'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Content Calendar for %' AND u.username = 'laurah'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Event Planning for %' AND u.username = 'daniell'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Budget Tracking for %' AND u.username = 'sophiag'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'HR Management for %' AND u.username = 'jamesw'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Customer Support for %' AND u.username = 'oliviaa'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Social Media Strategy for %' AND u.username = 'joshuat'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Website Redesign for %' AND u.username = 'isabellat'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'New Feature Development for %' AND u.username = 'andrewm'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'User Research for %' AND u.username = 'miaj'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'PR Campaign for %' AND u.username = 'josephm'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Compliance Audit for %' AND u.username = 'amelial'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Supply Chain Management for %' AND u.username = 'ethanp'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'SEO Optimization for %' AND u.username = 'charlottew'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Competitive Analysis for %' AND u.username = 'alexanderh'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Legal Review for %' AND u.username = 'abigails'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Team Building for %' AND u.username = 'aidenc'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Product Feedback for %' AND u.username = 'avar'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Customer Interviews for %' AND u.username = 'williaml'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Market Research for %' AND u.username = 'sofiar'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Fundraising for %' AND u.username = 'elijahw'
UNION ALL
SELECT b.id, u.id
FROM boards b
JOIN users u ON b.name NOT LIKE CONCAT('%', u.first_name, '%')
WHERE b.name LIKE 'Investor Relations for %' AND u.username = 'madisony';

-- COMMENTS --
INSERT INTO comments (card_id, user_id, content, created_date)
SELECT c.id, u.id, 'This task needs to be prioritized.', '2024-04-01 10:00:00'
FROM cards c
JOIN users u ON u.username = 'johndoe'
WHERE c.name LIKE 'Task 1' UNION ALL

SELECT c.id, u.id, 'I have completed my part.', '2024-04-02 11:00:00'
FROM cards c
JOIN users u ON u.username = 'janesmith'
WHERE c.name LIKE 'Task 2' UNION ALL

SELECT c.id, u.id, 'Need more details on this task.', '2024-04-03 12:00:00'
FROM cards c
JOIN users u ON u.username = 'michaelj'
WHERE c.name LIKE 'Task 3' UNION ALL

SELECT c.id, u.id, 'Reviewed and approved.', '2024-04-04 13:00:00'
FROM cards c
JOIN users u ON u.username = 'emilyw'
WHERE c.name LIKE 'Task 4' UNION ALL

SELECT c.id, u.id, 'Working on this task now.', '2024-04-05 14:00:00'
FROM cards c
JOIN users u ON u.username = 'chrisb'
WHERE c.name LIKE 'In Progress Task 1' UNION ALL

SELECT c.id, u.id, 'I will handle this task.', '2024-04-06 15:00:00'
FROM cards c
JOIN users u ON u.username = 'sarahj'
WHERE c.name LIKE 'In Progress Task 2' UNION ALL

SELECT c.id, u.id, 'Task is nearly complete.', '2024-04-07 16:00:00'
FROM cards c
JOIN users u ON u.username = 'matthewg'
WHERE c.name LIKE 'In Progress Task 3' UNION ALL

SELECT c.id, u.id, 'This task is done.', '2024-04-08 17:00:00'
FROM cards c
JOIN users u ON u.username = 'jessicam'
WHERE c.name LIKE 'Done Task 1' UNION ALL

SELECT c.id, u.id, 'Great job on this task!', '2024-04-09 18:00:00'
FROM cards c
JOIN users u ON u.username = 'davidr'
WHERE c.name LIKE 'Done Task 2' UNION ALL

SELECT c.id, u.id, 'This needs a final review.', '2024-04-10 19:00:00'
FROM cards c
JOIN users u ON u.username = 'laurah'
WHERE c.name LIKE 'Done Task 3' UNION ALL

SELECT c.id, u.id, 'This task is important.', '2024-04-11 20:00:00'
FROM cards c
JOIN users u ON u.username = 'daniell'
WHERE c.name LIKE 'Backlog Task 1' UNION ALL

SELECT c.id, u.id, 'Let me take this one.', '2024-04-12 21:00:00'
FROM cards c
JOIN users u ON u.username = 'sophiag'
WHERE c.name LIKE 'Backlog Task 2' UNION ALL

SELECT c.id, u.id, 'I will start this tomorrow.', '2024-04-13 22:00:00'
FROM cards c
JOIN users u ON u.username = 'jamesw'
WHERE c.name LIKE 'Backlog Task 3' UNION ALL

SELECT c.id, u.id, 'This task is critical.', '2024-04-14 23:00:00'
FROM cards c
JOIN users u ON u.username = 'oliviaa'
WHERE c.name LIKE 'Sprint Planning Task 1' UNION ALL

SELECT c.id, u.id, 'We need to discuss this.', '2024-04-15 10:00:00'
FROM cards c
JOIN users u ON u.username = 'joshuat'
WHERE c.name LIKE 'Sprint Planning Task 2' UNION ALL

SELECT c.id, u.id, 'Let’s focus on this task.', '2024-04-16 11:00:00'
FROM cards c
JOIN users u ON u.username = 'isabellat'
WHERE c.name LIKE 'Sprint Planning Task 3' UNION ALL

SELECT c.id, u.id, 'This task is ready for review.', '2024-04-17 12:00:00'
FROM cards c
JOIN users u ON u.username = 'andrewm'
WHERE c.name LIKE 'Review Task 1' UNION ALL

SELECT c.id, u.id, 'Approved this task.', '2024-04-18 13:00:00'
FROM cards c
JOIN users u ON u.username = 'miaj'
WHERE c.name LIKE 'Review Task 2' UNION ALL

SELECT c.id, u.id, 'This looks good to me.', '2024-04-19 14:00:00'
FROM cards c
JOIN users u ON u.username = 'josephm'
WHERE c.name LIKE 'Review Task 3' UNION ALL

SELECT c.id, u.id, 'I have some suggestions.', '2024-04-20 15:00:00'
FROM cards c
JOIN users u ON u.username = 'amelial'
WHERE c.name LIKE 'Ideas Task 1' UNION ALL

SELECT c.id, u.id, 'We need more resources.', '2024-04-21 16:00:00'
FROM cards c
JOIN users u ON u.username = 'ethanp'
WHERE c.name LIKE 'Ideas Task 2' UNION ALL

SELECT c.id, u.id, 'Let’s brainstorm this.', '2024-04-22 17:00:00'
FROM cards c
JOIN users u ON u.username = 'charlottew'
WHERE c.name LIKE 'Ideas Task 3' UNION ALL

SELECT c.id, u.id, 'This task is in progress.', '2024-04-23 18:00:00'
FROM cards c
JOIN users u ON u.username = 'alexanderh'
WHERE c.name LIKE 'In Development Task 1' UNION ALL

SELECT c.id, u.id, 'Making good progress.', '2024-04-24 19:00:00'
FROM cards c
JOIN users u ON u.username = 'abigails'
WHERE c.name LIKE 'In Development Task 2' UNION ALL

SELECT c.id, u.id, 'This task is nearly done.', '2024-04-25 20:00:00'
FROM cards c
JOIN users u ON u.username = 'aidenc'
WHERE c.name LIKE 'In Development Task 3' UNION ALL

SELECT c.id, u.id, 'Task completed successfully.', '2024-04-26 21:00:00'
FROM cards c
JOIN users u ON u.username = 'avar'
WHERE c.name LIKE 'Published Task 1' UNION ALL

SELECT c.id, u.id, 'Good work on this task.', '2024-04-27 22:00:00'
FROM cards c
JOIN users u ON u.username = 'williaml'
WHERE c.name LIKE 'Published Task 2' UNION ALL

SELECT c.id, u.id, 'This is now live.', '2024-04-28 23:00:00'
FROM cards c
JOIN users u ON u.username = 'sofiar'
WHERE c.name LIKE 'Published Task 3';

-- CHECKLISTS --
INSERT INTO checklists (card_id, name, is_checked, position)
SELECT c.id, 'Checklist Item 1', FALSE, 1 FROM cards c WHERE c.name = 'Task 1' UNION ALL
SELECT c.id, 'Checklist Item 2', TRUE, 2 FROM cards c WHERE c.name = 'Task 1' UNION ALL
SELECT c.id, 'Checklist Item 3', FALSE, 3 FROM cards c WHERE c.name = 'Task 1' UNION ALL

SELECT c.id, 'Checklist Item 1', TRUE, 1 FROM cards c WHERE c.name = 'Task 2' UNION ALL
SELECT c.id, 'Checklist Item 2', TRUE, 2 FROM cards c WHERE c.name = 'Task 2' UNION ALL
SELECT c.id, 'Checklist Item 3', FALSE, 3 FROM cards c WHERE c.name = 'Task 2' UNION ALL

SELECT c.id, 'Checklist Item 1', FALSE, 1 FROM cards c WHERE c.name = 'Task 3' UNION ALL
SELECT c.id, 'Checklist Item 2', FALSE, 2 FROM cards c WHERE c.name = 'Task 3' UNION ALL
SELECT c.id, 'Checklist Item 3', TRUE, 3 FROM cards c WHERE c.name = 'Task 3' UNION ALL

SELECT c.id, 'Checklist Item 1', FALSE, 1 FROM cards c WHERE c.name = 'Task 4' UNION ALL
SELECT c.id, 'Checklist Item 2', TRUE, 2 FROM cards c WHERE c.name = 'Task 4' UNION ALL
SELECT c.id, 'Checklist Item 3', FALSE, 3 FROM cards c WHERE c.name = 'Task 4' UNION ALL

SELECT c.id, 'Checklist Item 1', FALSE, 1 FROM cards c WHERE c.name = 'In Progress Task 1' UNION ALL
SELECT c.id, 'Checklist Item 2', FALSE, 2 FROM cards c WHERE c.name = 'In Progress Task 1' UNION ALL
SELECT c.id, 'Checklist Item 3', TRUE, 3 FROM cards c WHERE c.name = 'In Progress Task 1' UNION ALL

SELECT c.id, 'Checklist Item 1', TRUE, 1 FROM cards c WHERE c.name = 'In Progress Task 2' UNION ALL
SELECT c.id, 'Checklist Item 2', TRUE, 2 FROM cards c WHERE c.name = 'In Progress Task 2' UNION ALL
SELECT c.id, 'Checklist Item 3', FALSE, 3 FROM cards c WHERE c.name = 'In Progress Task 2' UNION ALL

SELECT c.id, 'Checklist Item 1', FALSE, 1 FROM cards c WHERE c.name = 'In Progress Task 3' UNION ALL
SELECT c.id, 'Checklist Item 2', FALSE, 2 FROM cards c WHERE c.name = 'In Progress Task 3' UNION ALL
SELECT c.id, 'Checklist Item 3', TRUE, 3 FROM cards c WHERE c.name = 'In Progress Task 3' UNION ALL

SELECT c.id, 'Checklist Item 1', FALSE, 1 FROM cards c WHERE c.name = 'Done Task 1' UNION ALL
SELECT c.id, 'Checklist Item 2', TRUE, 2 FROM cards c WHERE c.name = 'Done Task 1' UNION ALL
SELECT c.id, 'Checklist Item 3', TRUE, 3 FROM cards c WHERE c.name = 'Done Task 1' UNION ALL

SELECT c.id, 'Checklist Item 1', TRUE, 1 FROM cards c WHERE c.name = 'Done Task 2' UNION ALL
SELECT c.id, 'Checklist Item 2', FALSE, 2 FROM cards c WHERE c.name = 'Done Task 2' UNION ALL
SELECT c.id, 'Checklist Item 3', TRUE, 3 FROM cards c WHERE c.name = 'Done Task 2' UNION ALL

SELECT c.id, 'Checklist Item 1', FALSE, 1 FROM cards c WHERE c.name = 'Done Task 3' UNION ALL
SELECT c.id, 'Checklist Item 2', FALSE, 2 FROM cards c WHERE c.name = 'Done Task 3' UNION ALL
SELECT c.id, 'Checklist Item 3', TRUE, 3 FROM cards c WHERE c.name = 'Done Task 3' UNION ALL

SELECT c.id, 'Checklist Item 1', FALSE, 1 FROM cards c WHERE c.name = 'Backlog Task 1' UNION ALL
SELECT c.id, 'Checklist Item 2', TRUE, 2 FROM cards c WHERE c.name = 'Backlog Task 1' UNION ALL
SELECT c.id, 'Checklist Item 3', TRUE, 3 FROM cards c WHERE c.name = 'Backlog Task 1' UNION ALL

SELECT c.id, 'Checklist Item 1', TRUE, 1 FROM cards c WHERE c.name = 'Backlog Task 2' UNION ALL
SELECT c.id, 'Checklist Item 2', FALSE, 2 FROM cards c WHERE c.name = 'Backlog Task 2' UNION ALL
SELECT c.id, 'Checklist Item 3', TRUE, 3 FROM cards c WHERE c.name = 'Backlog Task 2' UNION ALL

SELECT c.id, 'Checklist Item 1', FALSE, 1 FROM cards c WHERE c.name = 'Backlog Task 3' UNION ALL
SELECT c.id, 'Checklist Item 2', TRUE, 2 FROM cards c WHERE c.name = 'Backlog Task 3' UNION ALL
SELECT c.id, 'Checklist Item 3', FALSE, 3 FROM cards c WHERE c.name = 'Backlog Task 3' UNION ALL

SELECT c.id, 'Checklist Item 1', TRUE, 1 FROM cards c WHERE c.name = 'Sprint Planning Task 1' UNION ALL
SELECT c.id, 'Checklist Item 2', FALSE, 2 FROM cards c WHERE c.name = 'Sprint Planning Task 1' UNION ALL
SELECT c.id, 'Checklist Item 3', TRUE, 3 FROM cards c WHERE c.name = 'Sprint Planning Task 1' UNION ALL

SELECT c.id, 'Checklist Item 1', FALSE, 1 FROM cards c WHERE c.name = 'Sprint Planning Task 2' UNION ALL
SELECT c.id, 'Checklist Item 2', TRUE, 2 FROM cards c WHERE c.name = 'Sprint Planning Task 2' UNION ALL
SELECT c.id, 'Checklist Item 3', FALSE, 3 FROM cards c WHERE c.name = 'Sprint Planning Task 2' UNION ALL

SELECT c.id, 'Checklist Item 1', TRUE, 1 FROM cards c WHERE c.name = 'Sprint Planning Task 3' UNION ALL
SELECT c.id, 'Checklist Item 2', FALSE, 2 FROM cards c WHERE c.name = 'Sprint Planning Task 3' UNION ALL
SELECT c.id, 'Checklist Item 3', TRUE, 3 FROM cards c WHERE c.name = 'Sprint Planning Task 3' UNION ALL

SELECT c.id, 'Checklist Item 1', FALSE, 1 FROM cards c WHERE c.name = 'Review Task 1' UNION ALL
SELECT c.id, 'Checklist Item 2', TRUE, 2 FROM cards c WHERE c.name = 'Review Task 1' UNION ALL
SELECT c.id, 'Checklist Item 3', FALSE, 3 FROM cards c WHERE c.name = 'Review Task 1' UNION ALL

SELECT c.id, 'Checklist Item 1', TRUE, 1 FROM cards c WHERE c.name = 'Review Task 2' UNION ALL
SELECT c.id, 'Checklist Item 2', FALSE, 2 FROM cards c WHERE c.name = 'Review Task 2' UNION ALL
SELECT c.id, 'Checklist Item 3', TRUE, 3 FROM cards c WHERE c.name = 'Review Task 2' UNION ALL

SELECT c.id, 'Checklist Item 1', FALSE, 1 FROM cards c WHERE c.name = 'Review Task 3' UNION ALL
SELECT c.id, 'Checklist Item 2', TRUE, 2 FROM cards c WHERE c.name = 'Review Task 3' UNION ALL
SELECT c.id, 'Checklist Item 3', TRUE, 3 FROM cards c WHERE c.name = 'Review Task 3' UNION ALL

SELECT c.id, 'Checklist Item 1', TRUE, 1 FROM cards c WHERE c.name = 'Ideas Task 1' UNION ALL
SELECT c.id, 'Checklist Item 2', FALSE, 2 FROM cards c WHERE c.name = 'Ideas Task 1' UNION ALL
SELECT c.id, 'Checklist Item 3', TRUE, 3 FROM cards c WHERE c.name = 'Ideas Task 1' UNION ALL

SELECT c.id, 'Checklist Item 1', FALSE, 1 FROM cards c WHERE c.name = 'Ideas Task 2' UNION ALL
SELECT c.id, 'Checklist Item 2', TRUE, 2 FROM cards c WHERE c.name = 'Ideas Task 2' UNION ALL
SELECT c.id, 'Checklist Item 3', TRUE, 3 FROM cards c WHERE c.name = 'Ideas Task 2' UNION ALL

SELECT c.id, 'Checklist Item 1', TRUE, 1 FROM cards c WHERE c.name = 'Ideas Task 3' UNION ALL
SELECT c.id, 'Checklist Item 2', FALSE, 2 FROM cards c WHERE c.name = 'Ideas Task 3' UNION ALL
SELECT c.id, 'Checklist Item 3', TRUE, 3 FROM cards c WHERE c.name = 'Ideas Task 3' UNION ALL

SELECT c.id, 'Checklist Item 1', FALSE, 1 FROM cards c WHERE c.name = 'In Development Task 1' UNION ALL
SELECT c.id, 'Checklist Item 2', TRUE, 2 FROM cards c WHERE c.name = 'In Development Task 1' UNION ALL
SELECT c.id, 'Checklist Item 3', TRUE, 3 FROM cards c WHERE c.name = 'In Development Task 1' UNION ALL

SELECT c.id, 'Checklist Item 1', TRUE, 1 FROM cards c WHERE c.name = 'In Development Task 2' UNION ALL
SELECT c.id, 'Checklist Item 2', FALSE, 2 FROM cards c WHERE c.name = 'In Development Task 2' UNION ALL
SELECT c.id, 'Checklist Item 3', TRUE, 3 FROM cards c WHERE c.name = 'In Development Task 2' UNION ALL

SELECT c.id, 'Checklist Item 1', FALSE, 1 FROM cards c WHERE c.name = 'In Development Task 3' UNION ALL
SELECT c.id, 'Checklist Item 2', TRUE, 2 FROM cards c WHERE c.name = 'In Development Task 3' UNION ALL
SELECT c.id, 'Checklist Item 3', TRUE, 3 FROM cards c WHERE c.name = 'In Development Task 3' UNION ALL

SELECT c.id, 'Checklist Item 1', TRUE, 1 FROM cards c WHERE c.name = 'Published Task 1' UNION ALL
SELECT c.id, 'Checklist Item 2', TRUE, 2 FROM cards c WHERE c.name = 'Published Task 1' UNION ALL
SELECT c.id, 'Checklist Item 3', FALSE, 3 FROM cards c WHERE c.name = 'Published Task 1' UNION ALL

SELECT c.id, 'Checklist Item 1', FALSE, 1 FROM cards c WHERE c.name = 'Published Task 2' UNION ALL
SELECT c.id, 'Checklist Item 2', TRUE, 2 FROM cards c WHERE c.name = 'Published Task 2' UNION ALL
SELECT c.id, 'Checklist Item 3', TRUE, 3 FROM cards c WHERE c.name = 'Published Task 2' UNION ALL

SELECT c.id, 'Checklist Item 1', TRUE, 1 FROM cards c WHERE c.name = 'Published Task 3' UNION ALL
SELECT c.id, 'Checklist Item 2', TRUE, 2 FROM cards c WHERE c.name = 'Published Task 3' UNION ALL
SELECT c.id, 'Checklist Item 3', FALSE, 3 FROM cards c WHERE c.name = 'Published Task 3';

-- CARD MEMBERS --
INSERT INTO card_user (card_id, user_id)
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'johndoe'
WHERE c.name LIKE 'Task 1' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'janesmith'
WHERE c.name LIKE 'Task 2' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'michaelj'
WHERE c.name LIKE 'Task 3' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'emilyw'
WHERE c.name LIKE 'Task 4' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'chrisb'
WHERE c.name LIKE 'In Progress Task 1' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'sarahj'
WHERE c.name LIKE 'In Progress Task 2' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'matthewg'
WHERE c.name LIKE 'In Progress Task 3' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'jessicam'
WHERE c.name LIKE 'Done Task 1' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'davidr'
WHERE c.name LIKE 'Done Task 2' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'laurah'
WHERE c.name LIKE 'Done Task 3' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'daniell'
WHERE c.name LIKE 'Backlog Task 1' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'sophiag'
WHERE c.name LIKE 'Backlog Task 2' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'jamesw'
WHERE c.name LIKE 'Backlog Task 3' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'oliviaa'
WHERE c.name LIKE 'Sprint Planning Task 1' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'joshuat'
WHERE c.name LIKE 'Sprint Planning Task 2' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'isabellat'
WHERE c.name LIKE 'Sprint Planning Task 3' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'andrewm'
WHERE c.name LIKE 'Review Task 1' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'miaj'
WHERE c.name LIKE 'Review Task 2' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'josephm'
WHERE c.name LIKE 'Review Task 3' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'amelial'
WHERE c.name LIKE 'Ideas Task 1' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'ethanp'
WHERE c.name LIKE 'Ideas Task 2' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'charlottew'
WHERE c.name LIKE 'Ideas Task 3' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'alexanderh'
WHERE c.name LIKE 'In Development Task 1' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'abigails'
WHERE c.name LIKE 'In Development Task 2' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'aidenc'
WHERE c.name LIKE 'In Development Task 3' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'avar'
WHERE c.name LIKE 'Published Task 1' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON u.username = 'williaml'
WHERE c.name LIKE 'Published Task 2' UNION ALL
SELECT c.id, u.id
FROM cards c
JOIN users u ON c.name LIKE 'Published Task 3' AND u.username = 'sofiar';

-- CARD ACTIVITIES --
INSERT INTO card_activity (card_id, user_id, activity, created_date)
SELECT c.id, u.id, 'Task created', '2024-04-01 10:00:00'
FROM cards c
JOIN users u ON u.username = 'johndoe'
WHERE c.name = 'Task 1' UNION ALL
SELECT c.id, u.id, 'Task assigned to John Doe', '2024-04-01 11:00:00'
FROM cards c
JOIN users u ON u.username = 'johndoe'
WHERE c.name = 'Task 1' UNION ALL
SELECT c.id, u.id, 'Status changed to In Progress', '2024-04-02 09:00:00'
FROM cards c
JOIN users u ON u.username = 'janesmith'
WHERE c.name = 'Task 2' UNION ALL
SELECT c.id, u.id, 'Comment added', '2024-04-02 10:00:00'
FROM cards c
JOIN users u ON u.username = 'michaelj'
WHERE c.name = 'Task 3' UNION ALL
SELECT c.id, u.id, 'Due date set', '2024-04-03 14:00:00'
FROM cards c
JOIN users u ON u.username = 'emilyw'
WHERE c.name = 'Task 4' UNION ALL
SELECT c.id, u.id, 'Task marked as complete', '2024-04-04 17:00:00'
FROM cards c
JOIN users u ON u.username = 'chrisb'
WHERE c.name = 'In Progress Task 1' UNION ALL
SELECT c.id, u.id, 'Reminder set', '2024-04-05 12:00:00'
FROM cards c
JOIN users u ON u.username = 'sarahj'
WHERE c.name = 'In Progress Task 2' UNION ALL
SELECT c.id, u.id, 'Task moved to Done', '2024-04-06 13:00:00'
FROM cards c
JOIN users u ON u.username = 'matthewg'
WHERE c.name = 'In Progress Task 3' UNION ALL
SELECT c.id, u.id, 'Description updated', '2024-04-07 15:00:00'
FROM cards c
JOIN users u ON u.username = 'jessicam'
WHERE c.name = 'Done Task 1' UNION ALL
SELECT c.id, u.id, 'Task reopened', '2024-04-08 08:00:00'
FROM cards c
JOIN users u ON u.username = 'davidr'
WHERE c.name = 'Done Task 2' UNION ALL
SELECT c.id, u.id, 'Checklist item added', '2024-04-09 09:30:00'
FROM cards c
JOIN users u ON u.username = 'laurah'
WHERE c.name = 'Done Task 3' UNION ALL
SELECT c.id, u.id, 'Attachment uploaded', '2024-04-10 10:45:00'
FROM cards c
JOIN users u ON u.username = 'daniell'
WHERE c.name = 'Backlog Task 1' UNION ALL
SELECT c.id, u.id, 'Task assigned to Sarah Jones', '2024-04-11 11:15:00'
FROM cards c
JOIN users u ON u.username = 'sophiag'
WHERE c.name = 'Backlog Task 2' UNION ALL
SELECT c.id, u.id, 'Priority set to high', '2024-04-12 14:30:00'
FROM cards c
JOIN users u ON u.username = 'jamesw'
WHERE c.name = 'Backlog Task 3' UNION ALL
SELECT c.id, u.id, 'Due date changed', '2024-04-13 16:00:00'
FROM cards c
JOIN users u ON u.username = 'oliviaa'
WHERE c.name = 'Sprint Planning Task 1' UNION ALL
SELECT c.id, u.id, 'Comment deleted', '2024-04-14 09:00:00'
FROM cards c
JOIN users u ON u.username = 'joshuat'
WHERE c.name = 'Sprint Planning Task 2' UNION ALL
SELECT c.id, u.id, 'Task reassigned to Emily Williams', '2024-04-15 10:30:00'
FROM cards c
JOIN users u ON u.username = 'isabellat'
WHERE c.name = 'Sprint Planning Task 3' UNION ALL
SELECT c.id, u.id, 'Status changed to In Review', '2024-04-16 13:00:00'
FROM cards c
JOIN users u ON u.username = 'andrewm'
WHERE c.name = 'Review Task 1' UNION ALL
SELECT c.id, u.id, 'Task marked as incomplete', '2024-04-17 15:00:00'
FROM cards c
JOIN users u ON u.username = 'miaj'
WHERE c.name = 'Review Task 2' UNION ALL
SELECT c.id, u.id, 'New due date set', '2024-04-18 16:30:00'
FROM cards c
JOIN users u ON u.username = 'josephm'
WHERE c.name = 'Review Task 3' UNION ALL
SELECT c.id, u.id, 'Task description changed', '2024-04-19 09:45:00'
FROM cards c
JOIN users u ON u.username = 'amelial'
WHERE c.name = 'Ideas Task 1' UNION ALL
SELECT c.id, u.id, 'Reminder updated', '2024-04-20 11:15:00'
FROM cards c
JOIN users u ON u.username = 'ethanp'
WHERE c.name = 'Ideas Task 2' UNION ALL
SELECT c.id, u.id, 'Checklist item completed', '2024-04-21 13:30:00'
FROM cards c
JOIN users u ON u.username = 'charlottew'
WHERE c.name = 'Ideas Task 3' UNION ALL
SELECT c.id, u.id, 'Task moved to In Development', '2024-04-22 15:00:00'
FROM cards c
JOIN users u ON u.username = 'alexanderh'
WHERE c.name = 'In Development Task 1' UNION ALL
SELECT c.id, u.id, 'Comment added', '2024-04-23 16:30:00'
FROM cards c
JOIN users u ON u.username = 'abigails'
WHERE c.name = 'In Development Task 2' UNION ALL
SELECT c.id, u.id, 'Task flagged for review', '2024-04-24 09:00:00'
FROM cards c
JOIN users u ON u.username = 'aidenc'
WHERE c.name = 'In Development Task 3' UNION ALL
SELECT c.id, u.id, 'Attachment removed', '2024-04-25 10:00:00'
FROM cards c
JOIN users u ON u.username = 'avar'
WHERE c.name = 'Published Task 1' UNION ALL
SELECT c.id, u.id, 'Task duplicated', '2024-04-26 11:30:00'
FROM cards c
JOIN users u ON u.username = 'williaml'
WHERE c.name = 'Published Task 2' UNION ALL
SELECT c.id, u.id, 'Checklist item added', '2024-04-27 13:00:00'
FROM cards c
JOIN users u ON u.username = 'sofiar'
WHERE c.name = 'Published Task 3';

-- GENERAL LABELS --
INSERT INTO core_labels (id, name, color)
VALUES
(UUID_TO_BIN(UUID()), 'High Priority', '#FF0000'), -- Rojo
(UUID_TO_BIN(UUID()), 'Medium Priority', '#FFA500'), -- Naranja
(UUID_TO_BIN(UUID()), 'Low Priority', '#FFFF00'), -- Amarillo
(UUID_TO_BIN(UUID()), 'Bug', '#800080'), -- Púrpura
(UUID_TO_BIN(UUID()), 'Feature', '#008000'), -- Verde
(UUID_TO_BIN(UUID()), 'Improvement', '#0000FF'), -- Azul
(UUID_TO_BIN(UUID()), 'Research', '#00FFFF'), -- Cian
(UUID_TO_BIN(UUID()), 'Design', '#FFC0CB'), -- Rosa
(UUID_TO_BIN(UUID()), 'Testing', '#A52A2A'), -- Marrón
(UUID_TO_BIN(UUID()), 'Documentation', '#808080'); -- Gris

-- BOARD LABELS --
INSERT INTO board_labels (id, board_id, name, color)
SELECT UUID_TO_BIN(UUID()), b.id, 'Urgent', '#FF0000' FROM boards b WHERE b.name LIKE 'Project Management for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Review', '#FFA500' FROM boards b WHERE b.name LIKE 'Project Management for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'To Discuss', '#FFFF00' FROM boards b WHERE b.name LIKE 'Team Collaboration for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Idea', '#800080' FROM boards b WHERE b.name LIKE 'Marketing Plan for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'In Progress', '#008000' FROM boards b WHERE b.name LIKE 'Product Launch for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Completed', '#0000FF' FROM boards b WHERE b.name LIKE 'Development Sprint for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Pending', '#00FFFF' FROM boards b WHERE b.name LIKE 'Client Onboarding for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Feedback', '#FFC0CB' FROM boards b WHERE b.name LIKE 'Q1 Goals for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Research', '#A52A2A' FROM boards b WHERE b.name LIKE 'Sales Pipeline for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Priority', '#808080' FROM boards b WHERE b.name LIKE 'Research and Development for %';
INSERT INTO board_labels (id, board_id, name, color)
SELECT UUID_TO_BIN(UUID()), b.id, 'High Priority', '#FF0000' FROM boards b WHERE b.name LIKE 'Content Calendar for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Medium Priority', '#FFA500' FROM boards b WHERE b.name LIKE 'Event Planning for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Low Priority', '#FFFF00' FROM boards b WHERE b.name LIKE 'Budget Tracking for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Critical', '#FF0000' FROM boards b WHERE b.name LIKE 'HR Management for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Feature', '#800080' FROM boards b WHERE b.name LIKE 'Customer Support for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Improvement', '#008000' FROM boards b WHERE b.name LIKE 'Social Media Strategy for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Bug', '#0000FF' FROM boards b WHERE b.name LIKE 'Website Redesign for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Testing', '#A52A2A' FROM boards b WHERE b.name LIKE 'New Feature Development for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Documentation', '#808080' FROM boards b WHERE b.name LIKE 'User Research for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Idea', '#FFC0CB' FROM boards b WHERE b.name LIKE 'PR Campaign for %';
INSERT INTO board_labels (id, board_id, name, color)
SELECT UUID_TO_BIN(UUID()), b.id, 'Urgent', '#FF0000' FROM boards b WHERE b.name LIKE 'Compliance Audit for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Review', '#FFA500' FROM boards b WHERE b.name LIKE 'Supply Chain Management for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'To Discuss', '#FFFF00' FROM boards b WHERE b.name LIKE 'SEO Optimization for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Idea', '#800080' FROM boards b WHERE b.name LIKE 'Competitive Analysis for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'In Progress', '#008000' FROM boards b WHERE b.name LIKE 'Legal Review for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Completed', '#0000FF' FROM boards b WHERE b.name LIKE 'Team Building for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Pending', '#00FFFF' FROM boards b WHERE b.name LIKE 'Product Feedback for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Feedback', '#FFC0CB' FROM boards b WHERE b.name LIKE 'Customer Interviews for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Research', '#A52A2A' FROM boards b WHERE b.name LIKE 'Market Research for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'Priority', '#808080' FROM boards b WHERE b.name LIKE 'Fundraising for %' UNION ALL
SELECT UUID_TO_BIN(UUID()), b.id, 'High Priority', '#FF0000' FROM boards b WHERE b.name LIKE 'Investor Relations for %';

-- CARD LABELS --
INSERT INTO card_labels (label_id, card_id)
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Task 1'
WHERE cl.name = 'High Priority' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Task 2'
WHERE cl.name = 'Medium Priority' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Task 3'
WHERE cl.name = 'Low Priority' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Task 4'
WHERE cl.name = 'Bug' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'In Progress Task 1'
WHERE cl.name = 'Feature' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'In Progress Task 2'
WHERE cl.name = 'Improvement' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'In Progress Task 3'
WHERE cl.name = 'Research' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Done Task 1'
WHERE cl.name = 'Design' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Done Task 2'
WHERE cl.name = 'Testing' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Done Task 3'
WHERE cl.name = 'Documentation' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Backlog Task 1'
WHERE cl.name = 'High Priority' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Backlog Task 2'
WHERE cl.name = 'Medium Priority' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Backlog Task 3'
WHERE cl.name = 'Low Priority' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Sprint Planning Task 1'
WHERE cl.name = 'Critical' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Sprint Planning Task 2'
WHERE cl.name = 'Feature' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Sprint Planning Task 3'
WHERE cl.name = 'Improvement' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Review Task 1'
WHERE cl.name = 'Bug' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Review Task 2'
WHERE cl.name = 'Testing' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Review Task 3'
WHERE cl.name = 'Documentation' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Ideas Task 1'
WHERE cl.name = 'Idea' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Ideas Task 2'
WHERE cl.name = 'Research' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Ideas Task 3'
WHERE cl.name = 'Priority' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'In Development Task 1'
WHERE cl.name = 'High Priority' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'In Development Task 2'
WHERE cl.name = 'Medium Priority' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'In Development Task 3'
WHERE cl.name = 'Low Priority' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Published Task 1'
WHERE cl.name = 'Urgent' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Published Task 2'
WHERE cl.name = 'Review' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Published Task 3'
WHERE cl.name = 'To Discuss';
INSERT INTO card_labels (label_id, card_id)
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Task 1'
WHERE cl.name = 'Urgent' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Task 2'
WHERE cl.name = 'High Priority' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Task 3'
WHERE cl.name = 'Review' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Task 4'
WHERE cl.name = 'To Discuss' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'In Progress Task 1'
WHERE cl.name = 'Idea' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'In Progress Task 2'
WHERE cl.name = 'In Progress' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'In Progress Task 3'
WHERE cl.name = 'Completed' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Done Task 1'
WHERE cl.name = 'Pending' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Done Task 2'
WHERE cl.name = 'Feedback' UNION ALL
SELECT cl.id, c.id
FROM core_labels cl
JOIN cards c ON c.name = 'Done Task 3'
WHERE cl.name = 'Research';

-- ATTACHMENTS
INSERT INTO attachments (id, card_id, user_id, upload_date, filename, location)
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-01 10:00:00', 'task1_document.pdf', '/attachments/task1_document.pdf'
FROM cards c
JOIN users u ON u.username = 'johndoe'
WHERE c.name = 'Task 1' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-02 11:00:00', 'task2_screenshot.png', '/attachments/task2_screenshot.png'
FROM cards c
JOIN users u ON u.username = 'janesmith'
WHERE c.name = 'Task 2' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-03 12:00:00', 'task3_presentation.pptx', '/attachments/task3_presentation.pptx'
FROM cards c
JOIN users u ON u.username = 'michaelj'
WHERE c.name = 'Task 3' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-04 13:00:00', 'task4_image.jpg', '/attachments/task4_image.jpg'
FROM cards c
JOIN users u ON u.username = 'emilyw'
WHERE c.name = 'Task 4' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-05 14:00:00', 'inprogress1_spec.docx', '/attachments/inprogress1_spec.docx'
FROM cards c
JOIN users u ON u.username = 'chrisb'
WHERE c.name = 'In Progress Task 1' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-06 15:00:00', 'inprogress2_mockup.png', '/attachments/inprogress2_mockup.png'
FROM cards c
JOIN users u ON u.username = 'sarahj'
WHERE c.name = 'In Progress Task 2' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-07 16:00:00', 'inprogress3_notes.txt', '/attachments/inprogress3_notes.txt'
FROM cards c
JOIN users u ON u.username = 'matthewg'
WHERE c.name = 'In Progress Task 3' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-08 17:00:00', 'done1_summary.pdf', '/attachments/done1_summary.pdf'
FROM cards c
JOIN users u ON u.username = 'jessicam'
WHERE c.name = 'Done Task 1' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-09 18:00:00', 'done2_feedback.docx', '/attachments/done2_feedback.docx'
FROM cards c
JOIN users u ON u.username = 'davidr'
WHERE c.name = 'Done Task 2' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-10 19:00:00', 'done3_report.xlsx', '/attachments/done3_report.xlsx'
FROM cards c
JOIN users u ON u.username = 'laurah'
WHERE c.name = 'Done Task 3' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-11 20:00:00', 'backlog1_plan.pdf', '/attachments/backlog1_plan.pdf'
FROM cards c
JOIN users u ON u.username = 'daniell'
WHERE c.name = 'Backlog Task 1' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-12 21:00:00', 'backlog2_idea.jpg', '/attachments/backlog2_idea.jpg'
FROM cards c
JOIN users u ON u.username = 'sophiag'
WHERE c.name = 'Backlog Task 2' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-13 22:00:00', 'backlog3_brief.txt', '/attachments/backlog3_brief.txt'
FROM cards c
JOIN users u ON u.username = 'jamesw'
WHERE c.name = 'Backlog Task 3' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-14 23:00:00', 'sprintplanning1_diagram.svg', '/attachments/sprintplanning1_diagram.svg'
FROM cards c
JOIN users u ON u.username = 'oliviaa'
WHERE c.name = 'Sprint Planning Task 1' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-15 10:00:00', 'sprintplanning2_overview.pptx', '/attachments/sprintplanning2_overview.pptx'
FROM cards c
JOIN users u ON u.username = 'joshuat'
WHERE c.name = 'Sprint Planning Task 2' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-16 11:00:00', 'sprintplanning3_data.csv', '/attachments/sprintplanning3_data.csv'
FROM cards c
JOIN users u ON u.username = 'isabellat'
WHERE c.name = 'Sprint Planning Task 3' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-17 12:00:00', 'review1_feedback.pdf', '/attachments/review1_feedback.pdf'
FROM cards c
JOIN users u ON u.username = 'andrewm'
WHERE c.name = 'Review Task 1' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-18 13:00:00', 'review2_changes.docx', '/attachments/review2_changes.docx'
FROM cards c
JOIN users u ON u.username = 'miaj'
WHERE c.name = 'Review Task 2' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-19 14:00:00', 'review3_overview.xlsx', '/attachments/review3_overview.xlsx'
FROM cards c
JOIN users u ON u.username = 'josephm'
WHERE c.name = 'Review Task 3' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-20 15:00:00', 'ideas1_concept.pdf', '/attachments/ideas1_concept.pdf'
FROM cards c
JOIN users u ON u.username = 'amelial'
WHERE c.name = 'Ideas Task 1' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-21 16:00:00', 'ideas2_research.docx', '/attachments/ideas2_research.docx'
FROM cards c
JOIN users u ON u.username = 'ethanp'
WHERE c.name = 'Ideas Task 2' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-22 17:00:00', 'ideas3_proposal.txt', '/attachments/ideas3_proposal.txt'
FROM cards c
JOIN users u ON u.username = 'charlottew'
WHERE c.name = 'Ideas Task 3' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-23 18:00:00', 'indevelopment1_specification.pdf', '/attachments/indevelopment1_specification.pdf'
FROM cards c
JOIN users u ON u.username = 'alexanderh'
WHERE c.name = 'In Development Task 1' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-24 19:00:00', 'indevelopment2_design.png', '/attachments/indevelopment2_design.png'
FROM cards c
JOIN users u ON u.username = 'abigails'
WHERE c.name = 'In Development Task 2' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-25 20:00:00', 'indevelopment3_requirements.docx', '/attachments/indevelopment3_requirements.docx'
FROM cards c
JOIN users u ON u.username = 'aidenc'
WHERE c.name = 'In Development Task 3' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-26 21:00:00', 'published1_release_notes.pdf', '/attachments/published1_release_notes.pdf'
FROM cards c
JOIN users u ON u.username = 'avar'
WHERE c.name = 'Published Task 1' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-27 22:00:00', 'published2_announcement.png', '/attachments/published2_announcement.png'
FROM cards c
JOIN users u ON u.username = 'williaml'
WHERE c.name = 'Published Task 2' UNION ALL
SELECT UUID_TO_BIN(UUID()), c.id, u.id, '2024-04-28 23:00:00', 'published3_documentation.docx', '/attachments/published3_documentation.docx'
FROM cards c
JOIN users u ON u.username = 'sofiar'
WHERE c.name = 'Published Task 3';
