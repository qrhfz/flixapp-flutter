import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/movie/search_movies.dart';
import 'package:ditonton/domain/usecases/tvshow/search_tv_shows.dart';
import 'package:flutter/foundation.dart';

import '../../injection.dart';

class MovieSearchNotifier extends ChangeNotifier {
  final SearchMovies searchMovies;
  final SearchTvShows searchTvshows = locator.get<SearchTvShows>();

  MovieSearchNotifier({required this.searchMovies});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Movie> _moviesSearchResult = [];
  List<Movie> get moviesSearchResult => _moviesSearchResult;

  List<TvShow> _tvSearchResult = [];
  List<TvShow> get tvSearchResult => _tvSearchResult;

  String _message = '';
  String get message => _message;

  Future<void> fetchMovieSearch(String query) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await searchMovies.execute(query);
    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (data) {
        _moviesSearchResult = data;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTvSearch(String query) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await searchTvshows(query);
    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (data) {
        _tvSearchResult = data;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
