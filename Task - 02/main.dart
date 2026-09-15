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

 
  double calculateTotal() {
    double total = 0;

    for (double mark in marks.values) {
      total += mark;
    }

    return total;
  }

  
  double calculatePercentage() {
    double total = calculateTotal();
    double maximumMarks = marks.length * 100;

    return (total / maximumMarks) * 100;
  }

 
  void displayDetails() {
    print("Name: $name");
    print("Roll Number: $rollNumber");
    print("Course: $course");
    print("Age: $age");

    print("Marks:");
    marks.forEach((subject, mark) {
      print("$subject: $mark");
    });

    print("Total Marks: ${calculateTotal()}");
    print("Percentage: ${calculatePercentage()}%");
    print(" ");
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
      "Maths": 90,
      "Physics": 88,
      "Programming": 95,
    },
  );

  // Display results
  student1.displayDetails();
  student2.displayDetails();
}