import 'package:flutter/material.dart';
import 'package:movie_app/api/api.dart';
import 'package:movie_app/viewModel/movie_view_model.dart';
class MovieListViewModel extends ChangeNotifier {
  List<MovieViewModel> movies = <MovieViewModel>[];
  Future<void> fetchMovies(String keyword) async {
    final results =  await Webservice().fetchMovies(keyword);
    this.movies = results.map((item) => MovieViewModel(movie: item)).toList();
    notifyListeners();
  }
}