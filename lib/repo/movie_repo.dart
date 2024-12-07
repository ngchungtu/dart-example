import 'package:dart_application/models/movie.dart';
import 'package:dart_application/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

const urlGetMoviesList = 'https://reactnative.dev/movies.json';
const urlGetUserData = 'https://nct-api.vercel.app/_apiForTest';
const userListData = [
  {
    "intId": 1,
    "strId": "1",
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {"lat": "-37.3159", "lng": "81.1496"}
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  },
  {
    "intId": 2,
    "strId": "2",
    "name": "Ervin Howell",
    "username": "Antonette",
    "email": "Shanna@melissa.tv",
    "address": {
      "street": "Victor Plains",
      "suite": "Suite 879",
      "city": "Wisokyburgh",
      "zipcode": "90566-7771",
      "geo": {"lat": "-43.9509", "lng": "-34.4618"}
    },
    "phone": "010-692-6593 x09125",
    "website": "anastasia.net",
    "company": {
      "name": "Deckow-Crist",
      "catchPhrase": "Proactive didactic contingency",
      "bs": "synergize scalable supply-chains"
    }
  }
];

//function Future same like Promise in JS
Future<List<Movie>> fetchMovies() async {
  List<Movie> movies = [];
  try {
    final res = await http.get(Uri.parse(
        urlGetMoviesList)); //biến đối tượng url thành uri dùng Uri.parse
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      movies = (json['movies'] as List)
          .map((movie) => Movie.fromJson(movie))
          .toList();
      print('API Movies has been called: $res');
    }
    return movies;
  } on Exception catch (e) {
    throw Exception('Failed to fetch data: ${e.toString()}');
  }
}

Future<List<User>> fetchUserData() async {
  final resUser = await http.get(Uri.parse(urlGetUserData));
  if (resUser.statusCode == 200) {
    List userJS = jsonDecode(resUser.body);
    print('stop bugged');
    // final userList = userJS.map((userData) => User.fromJson(userData)).toList();
    // print('API User has been called: $userList');
    return userJS.map((userData) => User.fromJson(userData)).toList();
  } else {
    throw Exception(
        'Failed to fetch data: ${resUser.statusCode} - ${resUser.body}');
  }

  // List<User> user = [];
  // try {
  //   final resUser = await http.get(Uri.parse(urlGetUserData));
  //   if (resUser.statusCode == 200) {
  //     // print(res.body);
  //     Map<String, dynamic> json = jsonDecode(resUser.body);
  //     user = (json['data'] as List)
  //         .map((userData) => User.fromJson(userData))
  //         .toList();
  //     return user;
  //   }
  //   // print('API User has been called: $res');
  //   return user;
  // } on Exception catch (e) {
  //   throw Exception('Failed to fetch data: ${e.toString()}');
  // }
}
