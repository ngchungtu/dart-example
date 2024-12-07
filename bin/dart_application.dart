import 'package:dart_application/dart_application.dart' as dart_application;
import 'package:dart_application/func.dart';
import 'package:dart_application/models/bicycle.dart';
import 'package:dart_application/models/car.dart';
import 'package:dart_application/models/user.dart';
import 'package:dart_application/models/vinhecle.dart';
import 'package:dart_application/repo/movie_repo.dart';

void main(List<String> arguments) {
  // print('Hello world: ${dart_application.calculate()}!');

  sayhello('Tu Nguyen');
  String hosting = logHosting("ServerGTA", port: 3000);
  print(hosting);
  print('To day is ${getDateTime(date: 8, month: 7, year: 2024)}');
  sayhello('return');
  doSomeTasks(
      number_1: 1,
      number_2: 2,
      sum: (int result) => {print('sum: $result')},
      completion: (String noti) => {print("do task result: $noti")});

  //----------------------------------------------------------------
  // final -> KHÔNG được gán lại giá trị mảng (được thay thế lại giá trị trong mảng)
  // const -> KHÔNG được gán lại giá trị mảng (KHÔNG được thay thế lại giá trị trong mảng)

  final List<String> carList = [
    "BMW",
    "Audi",
    "Mercedes",
  ];

  print("There are ${carList.length} item in car list");

  for (var i = 0; i < carList.length; i++) {
    String carItem = carList[i];
    print(carItem);
  }

  carList.forEach((element) {
    print(element);
  });

  //--------------------------random sort---------------------------
  carList.shuffle();
  carList.asMap().forEach((index, item) {
    print('index: $index, value: $item');
  });

  List<String> carListClone = [...carList];
  carListClone.sort((a, b) => a.compareTo(b)); //sort a,b... to ...y,z
  carListClone.sort((a, b) => b.compareTo(a)); //sort ...y,z to a,b...
  print('carListClone, $carListClone');

  //--------------------------class defined---------------------------
  Vinhecle vin = new Vinhecle("VINFAST", 2022);
  print('vinhecle: $vin');

  //--------------------------extend class---------------------------
  Car car1 = Car('BWM', 2010, 4.5, 9.6);
  car1.name = 'Maybach';
  car1.year = 2022;
  car1.description();

  //--------------------------getter/setter---------------------------
  print('-----------');
  car1.age = 4;
  print(car1.year);
  print('-----------');

  //--------------------------bicycle class---------------------------
  Bicycle bicycle1 = Bicycle(name: "TALON", year: 2020, hasBasket: true);
  print(bicycle1);

  Bicycle bicycle2 = Bicycle(name: "TALON", year: 2020, hasBasket: true);
  print(bicycle2);

  // for exam 1
  // if(bicycle1.equals(bicycle2)){
  //   print('2 obj has same content');
  // }

  // for exam 2
  if (bicycle1 == bicycle2) {
    print('2 obj has same content');
  }

  Bicycle bicycle3 = bicycle1;
  //check nếu cả 2 biến cùng 1 ô nhớ
  if (identical(bicycle1, bicycle3)) {
    print('bicycle 1 and bicycle 1 are identical');
  }
  //check hashCode được tự động sinh ra
  //bi_1 == bi_3
  print('bi_1: ${bicycle1.hashCode}');
  print('bi_2: ${bicycle2.hashCode}');
  print('bi_3: ${bicycle3.hashCode}');

  if (bicycle1.hashCode == bicycle3.hashCode) {
    print('bicycle_1 and bicycle_3 same hashCode');
  }

  //--------------------------clone obj and change some fields-----------------
  print('bicycle_2: $bicycle2');
  Bicycle bicycle4 = bicycle2.copyWith(name: 'BMW', year: 2024);
  print('bicycle_4: $bicycle4');

  //--------------------------static value-----------------
  //biến statis lưu trữ trong global app (server url, port,...)
  print(Bicycle.maxSpeed);

  List<Car> cars = [
    Car('BWM', 2010, 4.5, 9.6),
    Car('Audi', 2015, 4.0, 9.8),
    Car('Mercedes', 2020, 4.2, 9.5),
  ];
  cars.forEach((element) {
    print('car: $element');
  });

  //insert a new car to the list
  //.inser(location, item)
  cars.insert(0, Car('Honda', 2000, 1.2, 7.5));

  //auto insert item to last list
  cars.add(Car('Yamaha', 2005, 2.2, 4.5));

  //print car list with key - element value
  cars.asMap().forEach((key, value) {
    print('key: $key, value: $value');
  });

  //--------------------------filtered car-----------------
  List<Car> filteredCar = cars
      .where((element) => element.year >= 2000 && element.year <= 2014)
      .toList();
  filteredCar[0].name = 'KIA';
  filteredCar.asMap().forEach((key, element) {
    print('$key - filteredCar: $element');
  });

  //--------------------------sort-----------------
  List<Car> sortedCar = [...cars];
  sortedCar.sort(
      (a, b) => b.horsePower.compareTo(a.horsePower)); //sort from max to min
  print('after cloned and sorted');
  sortedCar.asMap().forEach((key, element) {
    print('$key - sortedCar: $element');
  });

  //--------------------------get only car name (or other field) in list---------
  List<String> carNames = cars.map((car) => car.name).toList();
  print('car names: $carNames');

  //--------------------------remove car-----------------
  cars.removeAt(0); //remove item at index 0
  cars.removeWhere((car) => car.name == 'Honda'); //remove item by condition

  //print after remove
  cars.asMap().forEach((key, element) {
    print('$key - after remove: $element');
  });

  //--------------------------key-value object-----------------
  final Map<String, Object> user = {
    'name': 'Tu Nguyen',
    'age': 30,
    'address': {'city': 'HCM', 'street': 'Hoc Mon - To Ky'},
  };
  user['age'] =
      '28'; //chỉ khai báo lại khi được khai báo là Final, Const không thể khai báo lại
  print(
      'name: ${user['name']}, age: ${user['age']}, address: ${user['address']}');

  //--------------------------call and fetch API-----------------
  // fetchMovies().then((movieList){
  //   print('movie list: $movieList');
  // });

  // fetchUserData();
  fetchMovies().then((user){
    user.forEach((element) { 
      print('user: $element');
    });
  });

  //--------------------------test-----------------
  
}
