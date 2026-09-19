/* 
Inheritance in Dart is a mechanism that allows a class to inherit properties and methods from another class. 
This promotes code reusability and establishes a relationship between classes.
 In Dart, the `extends` keyword is used to create a subclass that inherits from a superclass. 
 */

class Animal {
  void eat() {
    print("Animal is eating");
  }
  void sleep() {
    print("Animal is sleeping");
  }
}
class Dog extends Animal {
  void bark() {
    print("Dog is barking");
  }
}

void main () {
  Dog dog = Dog();
  dog.eat();
  dog.sleep();
  dog.bark();
}