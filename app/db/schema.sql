-- 1) Create DB + use it
CREATE DATABASE IF NOT EXISTS course_events_app
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE course_events_app;

-- 2) Users (students + teachers)
CREATE TABLE users (
  id            INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  role          ENUM('student','teacher') NOT NULL,
  first_name    VARCHAR(100) NOT NULL,
  last_name     VARCHAR(100) NOT NULL,
  email         VARCHAR(190) NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  created_at    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

  UNIQUE KEY uq_users_email (email),
  KEY idx_users_role (role)
) ENGINE=InnoDB;

-- 3) Events (created by a teacher)
CREATE TABLE events (
  id           INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title        VARCHAR(200) NOT NULL,
  description  TEXT NULL,
  start_at     DATETIME NOT NULL,
  end_at       DATETIME NULL,
  created_by   INT UNSIGNED NOT NULL,
  created_at   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

  KEY idx_events_start_at (start_at),
  KEY idx_events_created_by (created_by),
  CONSTRAINT fk_events_created_by
    FOREIGN KEY (created_by) REFERENCES users(id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 4) Attendances (who attended which event)
-- Students should only see events where they have a row here (present=1).
CREATE TABLE attendances (
  id          INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  event_id    INT UNSIGNED NOT NULL,
  student_id  INT UNSIGNED NOT NULL,
  present     TINYINT(1) NOT NULL DEFAULT 1,
  added_by    INT UNSIGNED NOT NULL, -- teacher who added it (or system)
  added_at    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

  UNIQUE KEY uq_attendance_event_student (event_id, student_id),
  KEY idx_attendance_student (student_id),
  KEY idx_attendance_event (event_id),

  CONSTRAINT fk_att_event
    FOREIGN KEY (event_id) REFERENCES events(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_att_student
    FOREIGN KEY (student_id) REFERENCES users(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_att_added_by
    FOREIGN KEY (added_by) REFERENCES users(id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 5) Resources for events (PDF link, join link, recording link)
CREATE TABLE resources (
  id         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  event_id   INT UNSIGNED NOT NULL,
  type       ENUM('pdf','live_link','recording') NOT NULL,
  title      VARCHAR(200) NOT NULL,
  url        VARCHAR(2048) NOT NULL,
  created_by INT UNSIGNED NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

  KEY idx_resources_event (event_id),
  CONSTRAINT fk_resources_event
    FOREIGN KEY (event_id) REFERENCES events(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_resources_created_by
    FOREIGN KEY (created_by) REFERENCES users(id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 6) Resource visibility per student
-- If a resource has NO rows here => visible to all (default).
-- If it has rows => only students with is_visible=1 see it (allowlist).
CREATE TABLE resource_visibility (
  id          INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  resource_id INT UNSIGNED NOT NULL,
  student_id  INT UNSIGNED NOT NULL,
  is_visible  TINYINT(1) NOT NULL DEFAULT 1,

  UNIQUE KEY uq_visibility_resource_student (resource_id, student_id),
  KEY idx_visibility_student (student_id),

  CONSTRAINT fk_vis_resource
    FOREIGN KEY (resource_id) REFERENCES resources(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_vis_student
    FOREIGN KEY (student_id) REFERENCES users(id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 7) Comments on events
CREATE TABLE comments (
  id         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  event_id   INT UNSIGNED NOT NULL,
  user_id    INT UNSIGNED NOT NULL,
  body       TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

  KEY idx_comments_event (event_id),
  KEY idx_comments_user (user_id),

  CONSTRAINT fk_comments_event
    FOREIGN KEY (event_id) REFERENCES events(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_comments_user
    FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;


INSERT INTO users (role, first_name, last_name, email, password_hash) VALUES
-- Teacher
('teacher', 'Ivan', 'Petrov', 'teacher@example.com', '$2y$10$HASH_TEACHER'),

-- Students
('student', 'Maria', 'Ivanova', 'maria@example.com', '$2y$10$HASH_STUDENT'),
('student', 'Georgi', 'Dimitrov', 'georgi@example.com', '$2y$10$HASH_STUDENT'),
('student', 'Petar', 'Nikolov', 'petar@example.com', '$2y$10$HASH_STUDENT'),
('student', 'Elena', 'Stoyanova', 'elena@example.com', '$2y$10$HASH_STUDENT'),
('student', 'Daniel', 'Kolev', 'daniel@example.com', '$2y$10$HASH_STUDENT'),
('student', 'Nikol', 'Hristova', 'nikol@example.com', '$2y$10$HASH_STUDENT'),
('student', 'Martin', 'Georgiev', 'martin@example.com', '$2y$10$HASH_STUDENT');

INSERT INTO events (title, description, start_at, end_at, created_by) VALUES
('Lecture 1: Introduction', 'Course overview and requirements',
 '2026-01-05 10:00:00', '2026-01-05 11:30:00', 1),

('Lecture 2: Web Basics', 'HTML, CSS and basic JavaScript',
 '2026-01-07 10:00:00', '2026-01-07 11:30:00', 1),

('Lecture 3: PHP & MySQL', 'Backend fundamentals',
 '2026-01-12 10:00:00', '2026-01-12 11:30:00', 1),

('Lecture 4: Security', 'Authentication and access control',
 '2026-01-14 10:00:00', '2026-01-14 11:30:00', 1);

INSERT INTO attendances (event_id, student_id, present, added_by) VALUES
-- Lecture 1
(1, 2, 1, 1),
(1, 3, 1, 1),
(1, 4, 1, 1),
(1, 5, 1, 1),

-- Lecture 2
(2, 2, 1, 1),
(2, 3, 1, 1),
(2, 6, 1, 1),
(2, 7, 1, 1),

-- Lecture 3
(3, 2, 1, 1),
(3, 4, 1, 1),
(3, 5, 1, 1),
(3, 8, 1, 1),

-- Lecture 4
(4, 3, 1, 1),
(4, 6, 1, 1),
(4, 7, 1, 1),
(4, 8, 1, 1);


INSERT INTO resources (event_id, type, title, url, created_by) VALUES
-- Lecture 1
(1, 'pdf', 'Lecture 1 Slides', 'https://example.com/lec1-slides.pdf', 1),
(1, 'recording', 'Lecture 1 Recording', 'https://example.com/lec1-video', 1),

-- Lecture 2
(2, 'pdf', 'HTML & CSS Slides', 'https://example.com/lec2-slides.pdf', 1),
(2, 'live_link', 'Live Session Link', 'https://meet.example.com/lec2', 1),

-- Lecture 3
(3, 'pdf', 'PHP & MySQL Slides', 'https://example.com/lec3-slides.pdf', 1),

-- Lecture 4
(4, 'pdf', 'Security Slides', 'https://example.com/lec4-slides.pdf', 1),
(4, 'recording', 'Security Lecture Recording', 'https://example.com/lec4-video', 1);


-- Restrict Lecture 3 slides to selected students only
INSERT INTO resource_visibility (resource_id, student_id, is_visible) VALUES
(5, 2, 1), -- Maria
(5, 4, 1), -- Petar
(5, 5, 1); -- Elena


INSERT INTO comments (event_id, user_id, body) VALUES
(1, 2, 'Very clear introduction, thank you!'),
(1, 3, 'Will the slides be uploaded later?'),
(2, 6, 'The HTML examples were helpful.'),
(3, 4, 'Can you share more PDO examples?'),
(4, 7, 'Security topics were very interesting.');
