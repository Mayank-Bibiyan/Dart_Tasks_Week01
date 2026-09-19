/* 
Combined Example using all 4 pillars of OOP in Dart: 
Inheritance, Polymorphism, Abstraction, and Encapsulation
*/

// ABSTRACTION
abstract class Vehicle {
  // Encapsulated data
  String _brand;
  int _speed;

  Vehicle(this._brand, this._speed);

  // Getters
  String get brand => _brand;
  int get speed => _speed;

  // Setter with validation
  set speed(int speed) {
    if (speed >= 0) {
      _speed = speed;
    } else {
      print("Speed cannot be negative");
    }
  }

  // Abstract method
  void start();
}


// INHERITANCE
class Car extends Vehicle {
  Car(String brand, int speed) : super(brand, speed);

  // POLYMORPHISM
  @override
  void start() {
    print("$brand car starts with a key");
  }

  void drive() {
    print("$brand car is driving at $speed km/h");
  }
}


// INHERITANCE
class Bike extends Vehicle {
  Bike(String brand, int speed) : super(brand, speed);

  // POLYMORPHISM
  @override
  void start() {
    print("$brand bike starts with a button");
  }

  void ride() {
    print("$brand bike is riding at $speed km/h");
  }
}


void main() {

  // Creating objects
  Car car = Car("BMW", 120);
  Bike bike = Bike("Yamaha", 80);

  // ENCAPSULATION
  print("Car brand: ${car.brand}");
  print("Car speed: ${car.speed}");

  car.speed = 150;
  print("Updated speed: ${car.speed}");

 

  // POLYMORPHISM
  Vehicle v1 = car;
  Vehicle v2 = bike;

  v1.start();
  v2.start();

  
  car.drive();
  bike.ride();
}