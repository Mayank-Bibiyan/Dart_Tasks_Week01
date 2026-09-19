/*
Polymorphism is a concept in object-oriented programming that allows objects of different classes to be treated as objects of a common superclass. 
It enables a single interface to represent different underlying forms (data types). 
In Dart, polymorphism can be achieved through method overriding and interfaces.
*/

class Animal {
  void sound() {
    print("Animal makes a sound");
  }
}

class Dog extends Animal {
  @override
  void sound() {
    print("Dog barks");
  }
}

class Cat extends Animal {
  @override
  void sound() {
    print("Cat meows");
  }
}

void main() {
  Animal myDog = Dog();
  Animal myCat = Cat();

  myDog.sound(); // Output: Dog barks
  myCat.sound(); // Output: Cat meows
}