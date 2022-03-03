import 'package:flutter/foundation.dart';

import '../utils/state_enum.dart';
import '../../domain/tv/entities/tv_show.dart';
import '../../domain/tv/usecases/search_tv_shows.dart';
import '../../injection.dart';

class TVShowSearchNotifier extends ChangeNotifier {
  TVShowSearchNotifier([SearchTVShows? searchTvShows]) {
    this._searchTvshows = searchTvShows ?? locator();
  }
  late final SearchTVShows _searchTvshows;

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  String _message = '';
  String get message => _message;

  List<TVShow> _tvSearchResult = [];
  List<TVShow> get tvSearchResult => _tvSearchResult;

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
