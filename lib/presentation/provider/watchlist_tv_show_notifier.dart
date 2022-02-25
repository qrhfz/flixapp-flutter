import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/tvshow/get_tv_show_watchlist.dart';
import 'package:ditonton/injection.dart';
import 'package:flutter/foundation.dart';

import '../../common/state_enum.dart';

class WatchlistTVShowNotifier extends ChangeNotifier {
  var _watchlistTvShows = <TVShow>[];
  List<TVShow> get watchlistTvShows => _watchlistTvShows;

  var _watchlistState = RequestState.Empty;
  RequestState get watchlistState => _watchlistState;

  String _message = '';
  String get message => _message;

  WatchlistTVShowNotifier({GetTVShowWatchlist? getWatchlistTvShows}) {
    this._getTvShowWatchlist = getWatchlistTvShows ?? locator();
  }

  late final GetTVShowWatchlist _getTvShowWatchlist;

  Future<void> fetchWatchlistTvShows() async {
    _watchlistState = RequestState.Loading;
    notifyListeners();

    final result = await _getTvShowWatchlist();
    result.fold(
      (failure) {
        _watchlistState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (data) {
        _watchlistState = RequestState.Loaded;
        _watchlistTvShows = data;
        notifyListeners();
      },
    );
  }
}
