class Student {
  String name;
  int rollNumber;
  String course;
  int age;

  Student(this.name, this.rollNumber, this.course, this.age);

  void displayDetails() {
    print("Name: $name");
    print("Roll Number: $rollNumber");
    print("Course: $course");
    print("Age: $age");
    print(" ");
  }
}

void main() {
  Student student1 = Student("Mayank", 101, "B.Tech CSE", 19);
  Student student2 = Student("Vishu", 102, "B.Tech IT", 21);
  Student student3 = Student("Shivam", 103, "BCA", 18);


  student1.displayDetails();
  student2.displayDetails();
  student3.displayDetails();
}