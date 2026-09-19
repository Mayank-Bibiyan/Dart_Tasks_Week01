/* Encapsulation in Dart is the Object-Oriented Programming (OOP) practice of 
bundling data (variables) and the methods that operate on them into a single unit (a class) 
while restricting direct access from the outside. 
It enforces data hiding, protects an object's internal state, and exposes interaction only through a controlled public interface */


class Student {
  // private variables
  String _name;
  int _age;

// constructor
  Student(this._name, this._age);

//Getter
  String get name => _name;
  int get age => _age;

//Setter
  set name(String name) {
    _name = name;
  }
  set age (int age) {
    if (age>0) {
      _age = age;
    } else {
          print("Age cannot be negative");
        }
   }
}

void main() {
  Student s = Student("Mayank", 19);
  
// accessing data using getters
  print("Name: ${s.name}");
  print("Age: ${s.age}");

// Modifying data using setters
  s.name = "Aman";
  s.age = 21;

  print("Updated Name: ${s.name}");
  print("Updated Age: ${s.age}");
}