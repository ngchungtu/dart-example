import 'package:dart_application/models/vinhecle.dart';

class Car extends Vinhecle {
  double engineSize = 0.0;
  double horsePower = 0.0;
  Car(String name, int year, this.engineSize, this.horsePower)
      : super(name, year); // super là thuộc tính của class cha

  void description() {
    print(
        'This car run with Engine Size: $engineSize and Horse Power: $horsePower');
  }

  //khai báo và gán lại cho biến year
  int get age => DateTime.now().year - year;
  set age(int value) {
    year = DateTime.now().year - value;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Car with name is $name, year is $year, $engineSize engine size andhorse power is $horsePower';
  }
}
