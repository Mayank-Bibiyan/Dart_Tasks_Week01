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

  // Named constructor for creating a student without marks
  Student.withoutMarks({
    required this.name,
    required this.rollNumber,
    required this.course,
    required this.age,
  }) : marks = {};

  // Named constructor for creating a student with default details
  Student.guest(String name, int rollNumber)
      : name = name,
        rollNumber = rollNumber,
        course = 'Not Assigned',
        age = 0,
        marks = {};

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
    if (marks.isEmpty) {
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
    const String noGrade = 'N/A';

    if (marks.isEmpty) {
      return noGrade;
    }

    double percentage = calculatePercentage();

    if (percentage >= 90) {
      return 'A+';
    } else if (percentage >= 80) {
      return 'A';
    } else if (percentage >= 70) {
      return 'B';
    } else if (percentage >= 60) {
      return 'C';
    } else if (percentage >= 50) {
      return 'D';
    } else if (percentage >= 40) {
      return 'E';
    } else {
      return 'F';
    }
  }

  // Display student details
  void displayDetails() {
    print('Name: $name');
    print('Roll Number: $rollNumber');
    print('Course: $course');
    print('Age: $age');

    if (marks.isEmpty) {
      print('Marks: Not Available');
      print('Grade: ${calculateGrade()}');
      print('-----------------------------');
      return;
    }

    print('Marks:');

    marks.forEach((subject, mark) {
      print('$subject: $mark');
    });

    if (!validateMarks()) {
      print('Error: Invalid marks! Marks must be between 0 and 100.');
      print('-----------------------------');
      return;
    }

    print('Total Marks: ${calculateTotal()}');
    print('Percentage: ${calculatePercentage()}%');
    print('Grade: ${calculateGrade()}');
    print('Status: ${isPassed() ? 'Pass' : 'Fail'}');
    print('-----------------------------');
  }
}

void main() {
  // Using parameterized constructor
  final Student student1 = Student(
    name: 'Rahul',
    rollNumber: 101,
    course: 'B.Tech CSE',
    age: 20,
    marks: {
      'Maths': 85,
      'Physics': 78,
      'Programming': 92,
    },
  );

  // Using named constructor
  final Student student2 = Student.withoutMarks(
    name: 'Priya',
    rollNumber: 102,
    course: 'B.Tech IT',
    age: 21,
  );

  // Using another named constructor
  final Student student3 = Student.guest('Aman', 103);

  student1.displayDetails();
  student2.displayDetails();
  student3.displayDetails();
}
