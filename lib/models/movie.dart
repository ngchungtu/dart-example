class Movie {
  final int id;
  final String title;
  final int releaseYear;

  Movie({required this.id, required this.title, required this.releaseYear});

  //convert type key-value to type JSON data
  //static factory
  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      id: int.parse(json['id']),
      title: json['title'],
      releaseYear: int.parse(json['releaseYear']),
    );
  }

  @override
  String toString() => 'id:$id title:$title releaseYear:$releaseYear';
}
