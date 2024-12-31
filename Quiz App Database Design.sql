-- Create Users table
CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    role ENUM('student', 'teacher') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Quizzes table
CREATE TABLE Quizzes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    teacher_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (teacher_id) REFERENCES Users(id) ON DELETE CASCADE
);

-- Create Questions table
CREATE TABLE Questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    quiz_id INT NOT NULL,
    text TEXT NOT NULL,
    FOREIGN KEY (quiz_id) REFERENCES Quizzes(id) ON DELETE CASCADE
);

-- Create Options table
CREATE TABLE Options (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question_id INT NOT NULL,
    text TEXT NOT NULL,
    is_correct BOOLEAN NOT NULL,
    FOREIGN KEY (question_id) REFERENCES Questions(id) ON DELETE CASCADE
);

-- Create Student_Answers table
CREATE TABLE Student_Answers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    quiz_id INT NOT NULL,
    question_id INT NOT NULL,
    option_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (quiz_id) REFERENCES Quizzes(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES Questions(id) ON DELETE CASCADE,
    FOREIGN KEY (option_id) REFERENCES Options(id) ON DELETE CASCADE
);
