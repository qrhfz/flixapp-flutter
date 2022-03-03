import 'package:domain/domain.dart';

import 'package:flutter/foundation.dart';

import '../helper/state_enum.dart';

class WatchlistTVShowNotifier extends ChangeNotifier {
  var _watchlistTvShows = <TVShow>[];
  List<TVShow> get watchlistTvShows => _watchlistTvShows;

  var _watchlistState = RequestState.empty;
  RequestState get watchlistState => _watchlistState;

  String _message = '';
  String get message => _message;

  WatchlistTVShowNotifier(this._getTvShowWatchlist);

  late final GetTVShowWatchlist _getTvShowWatchlist;

  Future<void> fetchWatchlistTvShows() async {
    _watchlistState = RequestState.loading;
    notifyListeners();

    final result = await _getTvShowWatchlist();
    result.fold(
      (failure) {
        _watchlistState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (data) {
        _watchlistState = RequestState.loaded;
        _watchlistTvShows = data;
        notifyListeners();
      },
    );
  }
}
