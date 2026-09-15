class Student {
  final String name;
  final int rollNumber;
  final String course;
  final int age;
  final Map<String, double> marks;

  // Parameterized constructor
  Student({
    required this.name,
    required this.rollNumber,
    required this.course,
    required this.age,
    required this.marks,
  });

  // Named constructor
  Student.withoutMarks({
    required this.name,
    required this.rollNumber,
    required this.course,
    required this.age,
  }) : marks = {};

  // Validate marks
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
    if (marks.isEmpty || !validateMarks()) {
      return 0;
    }

    double maximumMarks = marks.length * 100;

    return (calculateTotal() / maximumMarks) * 100;
  }

  // Determine pass/fail
  bool isPassed() {
    return calculatePercentage() >= 40;
  }

  // Determine grade
  String calculateGrade() {
    if (marks.isEmpty || !validateMarks()) {
      return "N/A";
    }

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

  // Display student details and result
  void displayDetails() {
    print("Name: $name");
    print("Roll Number: $rollNumber");
    print("Course: $course");
    print("Age: $age");

    if (marks.isEmpty) {
      print("Result: Marks not available.");
      print("-----------------------------");
      return;
    }

    if (!validateMarks()) {
      print("Result: Invalid marks.");
      print("Marks must be between 0 and 100.");
      print("-----------------------------");
      return;
    }

    print("Marks:");

    marks.forEach((subject, mark) {
      print("$subject: $mark");
    });

    print("Total Marks: ${calculateTotal()}");
    print("Percentage: ${calculatePercentage()}%");
    print("Grade: ${calculateGrade()}");
    print("Status: ${isPassed() ? "Pass" : "Fail"}");
    print("-----------------------------");
  }
}

// Search student by roll number
Student? searchStudent(List<Student> students, int rollNumber) {
  for (Student student in students) {
    if (student.rollNumber == rollNumber) {
      return student;
    }
  }

  return null;
}

// Find student with highest percentage
Student? findTopStudent(List<Student> students) {
  if (students.isEmpty) {
    return null;
  }

  Student? topStudent;

  for (Student student in students) {
    // Ignore students with invalid or unavailable marks
    if (student.marks.isEmpty || !student.validateMarks()) {
      continue;
    }

    if (topStudent == null ||
        student.calculatePercentage() > topStudent.calculatePercentage()) {
      topStudent = student;
    }
  }

  return topStudent;
}

void main() {
  // Multiple students
  final List<Student> students = [
    Student(
      name: "Rahul",
      rollNumber: 101,
      course: "B.Tech CSE",
      age: 20,
      marks: {
        "Maths": 85,
        "Physics": 78,
        "Programming": 92,
      },
    ),
    Student(
      name: "Priya",
      rollNumber: 102,
      course: "B.Tech IT",
      age: 21,
      marks: {
        "Maths": 90,
        "Physics": 88,
        "Programming": 95,
      },
    ),
    Student(
      name: "Aman",
      rollNumber: 103,
      course: "BCA",
      age: 20,
      marks: {
        "Maths": 65,
        "Physics": 72,
        "Programming": 68,
      },
    ),
    Student(
      name: "Neha",
      rollNumber: 104,
      course: "BCA",
      age: 19,
      marks: {
        "Maths": 110, // Invalid mark
        "Physics": 80,
        "Programming": 75,
      },
    ),
  ];

  // 1. Display all students
  print("========== ALL STUDENTS ==========");

  for (Student student in students) {
    student.displayDetails();
  }

  // 2. Search for a student
  print("========== SEARCH STUDENT ==========");

  int rollNumberToSearch = 102;

  Student? searchedStudent =
      searchStudent(students, rollNumberToSearch);

  if (searchedStudent != null) {
    print("Student found:");
    searchedStudent.displayDetails();
  } else {
    print(
      "Student with roll number $rollNumberToSearch does not exist.",
    );
  }

  // 3. Search for a non-existent student
  print("========== INVALID SEARCH ==========");

  int invalidRollNumber = 999;

  Student? notFound =
      searchStudent(students, invalidRollNumber);

  if (notFound != null) {
    notFound.displayDetails();
  } else {
    print(
      "Student with roll number $invalidRollNumber does not exist.",
    );
  }

  // 4. Find student with highest percentage
  print("========== TOP STUDENT ==========");

  Student? topStudent = findTopStudent(students);

  if (topStudent != null) {
    print("Student with highest percentage:");
    print("Name: ${topStudent.name}");
    print("Roll Number: ${topStudent.rollNumber}");
    print("Percentage: ${topStudent.calculatePercentage()}%");
    print("Grade: ${topStudent.calculateGrade()}");
  } else {
    print("No valid student result is available.");
  }
}

