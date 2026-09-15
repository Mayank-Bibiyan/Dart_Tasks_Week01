class Student {
  String name;
  int rollNumber;
  String course;
  int age;
  Map<String, double> marks;

  Student(
    this.name,
    this.rollNumber,
    this.course,
    this.age,
    this.marks,
  );

  // Validate Marks
  bool validateMarks() {
    for (double mark in marks.values) {
      if (mark < 0 || mark > 100) {
        return false;
      }
    }
    return true;
  }

  // Calculate total marks
  double calculateTotal() {
    double total = 0;

    for (double mark in marks.values) {
      total += mark;
    }

    return total;
  }

  // Calculate percentage
  double calculatePercentage() {
    double total = calculateTotal();
    double maximumMarks = marks.length * 100;

    return (total / maximumMarks) * 100;
  }

  // Determine pass/fail
  bool isPassed() {
    return calculatePercentage() >= 40;
  }

  // Determine grade
  String calculateGrade() {
    double percentage = calculatePercentage();

    if (percentage >= 90) {
      return "A+";
    } else if (percentage >= 80) {
      return "A";
    } else if (percentage >= 70) {
      return "B";
    } else if (percentage >= 60) {
      return "C";
    } else if (percentage >= 50) {
      return "D";
    } else if (percentage >= 40) {
      return "E";
    } else {
      return "F";
    }
  }

  // Display student details
  void displayDetails() {
    print("Name: $name");
    print("Roll Number: $rollNumber");
    print("Course: $course");
    print("Age: $age");

    print("Marks:");
    marks.forEach((subject, mark) {
      print("$subject: $mark");
    });

    if (!validateMarks()) {
      print("Error: Invalid marks! Marks must be between 0 and 100.");
      return;
    }

    print("Total Marks: ${calculateTotal()}");
    print("Percentage: ${calculatePercentage()}%");
    print("Grade: ${calculateGrade()}");
    print("Status: ${isPassed() ? "Pass" : "Fail"}");
  }
}

// Search for a student using roll number
Student? searchStudent(List<Student> students, int rollNumber) {
  for (Student student in students) {
    if (student.rollNumber == rollNumber) {
      return student;
    }
  }

  return null;
}

void main() {
  // Create multiple student objects
  List<Student> students = [
    Student(
      "Rahul",
      101,
      "B.Tech CSE",
      20,
      {
        "Maths": 85,
        "Physics": 78,
        "Programming": 92,
      },
    ),
    Student(
      "Priya",
      102,
      "B.Tech IT",
      21,
      {
        "Maths": 90,
        "Physics": 88,
        "Programming": 95,
      },
    ),
    Student(
      "Aman",
      103,
      "BCA",
      20,
      {
        "Maths": 65,
        "Physics": 72,
        "Programming": 68,
      },
    ),
  ];

  // Display all students
  print("===== All Students =====");

  for (Student student in students) {
    student.displayDetails();
    print("-----------------------------");
  }

  // Search for a student
  int rollNumberToSearch = 102;

  Student? result = searchStudent(students, rollNumberToSearch);

  if (result != null) {
    print("===== Student Found =====");
    result.displayDetails();
  } else {
    print("Student with roll number $rollNumberToSearch does not exist.");
  }

  // Search for a non-existent student
  int invalidRollNumber = 110;

  Student? notFound = searchStudent(students, invalidRollNumber);

  if (notFound != null) {
    print("===== Student Found =====");
    notFound.displayDetails();
  } else {
    print("Student with roll number $invalidRollNumber does not exist.");
  }
}

