/* Abstraction means hiding unnecessary implementation details and 
showing only the essential features.
It focuses on what something does rather than how it is done.*/

abstract class Vehicle {
  void start();
}

class Car extends Vehicle {
  @override
  void start() {
    print("Car starts with a key");
  }
}

class Bike extends Vehicle {
  @override
  void start() {
    print("Bike starts with a kick");
  }
}

void main() {
  Car car = Car();
  car.start();

  Bike bike = Bike();
  bike.start();
}