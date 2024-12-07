import 'package:dart_application/models/vinhecle.dart';

class Bicycle extends Vinhecle {
  bool hasBasket;
  static const int maxSpeed = 100;

  Bicycle({required String name, required int year, required this.hasBasket})
      : super(name, year);

  //--------------------------hàm so sánh 2 đối tượng-----------------
  //hàm so sánh 2 đối tượng (exam 1)
  // bool equals(Object other) =>
  //     identical(this, other) ||
  //     (other is Bicycle &&
  //         name == other.name &&
  //         year == other.year &&
  //         hasBasket == other.hasBasket);

  //dùng override định nghĩa cho hàm ở class parent đã có rồi, child chỉ cần hiển thị (exam 2)
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Bicycle &&
          name == other.name &&
          year == other.year &&
          hasBasket == other.hasBasket);

  //--------------------------hàm copy-----------------
  //copyWith = clone and change property's value
  Bicycle copyWith({String? name, int? year, bool? hasBasket}) => Bicycle(
        name: name ?? this.name,
        year: year ?? this.year,
        hasBasket: hasBasket ?? this.hasBasket,
      );

  @override
  String toString() => '${super.toString()}, hasBasket=$hasBasket';
}
