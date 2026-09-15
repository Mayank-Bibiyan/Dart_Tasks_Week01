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
    double total = calculateTotal();
    double maximumMarks = marks.length * 100;

    return (total / maximumMarks) * 100;
  }

  // Determine pass/fail status
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

  // Display student result
  void displayDetails() {
    print("Name: $name");
    print("Roll Number: $rollNumber");
    print("Course: $course");
    print("Age: $age");

    print("Marks:");
    marks.forEach((subject, mark) {
      print("$subject: $mark");
    });

    // Check for invalid marks
    if (!validateMarks()) {
      print("Error: Invalid marks! Marks must be between 0 and 100.");
      print("-----------------------------");
      return;
    }

    print("Total Marks: ${calculateTotal()}");
    print("Percentage: ${calculatePercentage()}%");
    print("Grade: ${calculateGrade()}");
    print("Status: ${isPassed() ? "Pass" : "Fail"}");

    print("-----------------------------");
  }
}

void main() {
  Student student1 = Student(
    "Mayank",
    101,
    "B.Tech CSE",
    19,
    {
      "Maths": 85,
      "Physics": 78,
      "Programming": 92,
    },
  );

  Student student2 = Student(
    "Vishu",
    102,
    "B.Tech IT",
    21,
    {
      "Maths": 35,
      "Physics": 42,
      "Programming": 38,
    },
  );

  // Student with invalid marks
  Student student3 = Student(
    "Shivam",
    103,
    "BCA",
    18,
    {
      "Maths": 110, // Invalid mark
      "Physics": 75,
      "Programming": 80,
    },
  );

  student1.displayDetails();
  student2.displayDetails();
  student3.displayDetails();
}