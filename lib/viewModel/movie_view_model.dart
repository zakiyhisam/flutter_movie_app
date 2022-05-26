import '../models/movie.dart';
class MovieViewModel {
  final Movie ?movie;
  MovieViewModel({this.movie});
  String get title {
    return movie!.title;
  }
  String get poster {
    return movie!.posterUrl;
  }
  String get yearReleased {
    return movie!.year;
  }
}