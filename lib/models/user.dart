class User {
  final int intId;
  final String name;
  final String email;

  User({required this.intId, required this.name, required this.email});

  void checkValue(int number_1, int number_2){
    if(number_1 != number_2){
      print('number 1 != number 2');
    } else {
      print('okela');
    }
  }

  factory User.fromJson(Map<String, dynamic> jsonUser) {
    return User(
        intId: jsonUser['intId'],
        name: jsonUser['name'],
        email: jsonUser['email']);
  }
    
  @override
  String toString() => "User has id:$intId, with name:$name, and email:$email";
}