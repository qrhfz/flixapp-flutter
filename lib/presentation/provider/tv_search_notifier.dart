import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../common/state_enum.dart';
import '../../domain/entities/tv_show.dart';
import '../../domain/usecases/tvshow/search_tv_shows.dart';
import '../../injection.dart';

class TvSearchNotifier extends ChangeNotifier {
  TvSearchNotifier([SearchTvShows? searchTvShows]) {
    this._searchTvshows = searchTvShows ?? locator();
  }
  late final SearchTvShows _searchTvshows;

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  String _message = '';
  String get message => _message;

  List<TvShow> _tvSearchResult = [];
  List<TvShow> get tvSearchResult => _tvSearchResult;

  Future<void> fetchTvSearch(String query) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await _searchTvshows(query);
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
