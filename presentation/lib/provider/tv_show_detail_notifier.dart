import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

import '../helper/state_enum.dart';

class TVShowDetailNotifier extends ChangeNotifier {
  //WATCHLIST
  late final GetTVShowWatchlistStatus _getWatchlistStatus;
  late final SaveTVShowWatchlist _saveWatchlist;
  late final RemoveTVShowWatchlist _removeWatchlist;
  late final GetTvRecommendations _getRecommendations;
  late final GetTVShowDetail _getDetail;

  TVShowDetailNotifier({
    required GetTVShowWatchlistStatus getWatchlistStatus,
    required SaveTVShowWatchlist saveWatchlist,
    required RemoveTVShowWatchlist removeWatchlist,
    required GetTvRecommendations getRecommendations,
    required GetTVShowDetail getDetail,
  }) {
    _getWatchlistStatus = getWatchlistStatus;
    _saveWatchlist = saveWatchlist;
    _removeWatchlist = removeWatchlist;
    _getRecommendations = getRecommendations;
    _getDetail = getDetail;
  }

  late TVShowDetail tv;
  List<TVShow> recommendations = [];

  static const String watchlistAddSuccessMessage =
      'Tv series added to watchlist successfully';
  static const String watchlistRemoveSuccessMessage =
      'Tv series removed from watchlist successfully';

  RequestState detailState = RequestState.empty;
  RequestState recommendationsState = RequestState.empty;
  bool isAddedToWatchlist = false;
  String message = '';
  String watchlistMessage = '';

  Future<void> fetchDetail(int id) async {
    detailState = RequestState.loading;
    final result = await _getDetail(id);

    result.fold(
      (fail) {
        detailState = RequestState.error;
        message = fail.message;
        notifyListeners();
      },
      (tvShow) async {
        detailState = RequestState.loaded;
        tv = tvShow;
        notifyListeners();
        await checkWatchlistStatus();
      },
    );
  }

  Future<void> fetchRecommendations(int id) async {
    recommendationsState = RequestState.loading;
    final res = await _getRecommendations(id);
    res.fold(
      (fail) {
        recommendationsState = RequestState.error;
      },
      (tvShowList) {
        recommendations = tvShowList;
        recommendationsState = RequestState.loaded;
      },
    );

    notifyListeners();
  }

  Future<void> addWatchlist() async {
    final result = await _saveWatchlist(tv);
    result.fold(
      (fail) {
        watchlistMessage = fail.message;
      },
      (message) {
        watchlistMessage = watchlistAddSuccessMessage;
      },
    );
    await checkWatchlistStatus();
    notifyListeners();
  }

  Future<void> removeFromWatchlist() async {
    final result = await _removeWatchlist(tv.id);
    result.fold(
      (fail) {
        watchlistMessage = fail.message;
      },
      (message) {
        watchlistMessage = watchlistRemoveSuccessMessage;
      },
    );
    await checkWatchlistStatus();
  }

  Future<void> checkWatchlistStatus() async {
    isAddedToWatchlist = await _getWatchlistStatus(tv.id);
    notifyListeners();
  }
}
