<?php
// ONLY FOR DEVELOPMENT / TESTING
session_start();

// HARD-CODE a test user ID from your DB
// Change these values to test different users
$_SESSION['user_id'] = 16;       // example: student with id=2
$_SESSION['role'] = 'student'; // or 'teacher'

// Prevent session fixation
session_regenerate_id(true);

// Redirect to profile page
header("Location: ../pages/student_event_page.php");
exit;
