class Movie {
  final String title;
  final String posterUrl;
  final String year;

  Movie({required this.title, required this.posterUrl, required this.year});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json["Title"],
        posterUrl: json["Poster"],
        year: json["Year"]
    );
  }
}