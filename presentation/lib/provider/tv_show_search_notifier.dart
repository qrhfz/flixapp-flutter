import 'package:flutter/foundation.dart';

import '../helper/state_enum.dart';
import 'package:domain/domain.dart';

class TVShowSearchNotifier extends ChangeNotifier {
  TVShowSearchNotifier(this._searchTvshows);
  late final SearchTVShows _searchTvshows;

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  String _message = '';
  String get message => _message;

  List<TVShow> _tvSearchResult = [];
  List<TVShow> get tvSearchResult => _tvSearchResult;

  Future<void> fetchTvSearch(String query) async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await _searchTvshows(query);
    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.error;
        notifyListeners();
      },
      (data) {
        _tvSearchResult = data;
        _state = RequestState.loaded;
        notifyListeners();
      },
    );
  }
}
