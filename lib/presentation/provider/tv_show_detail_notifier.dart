import 'dart:developer';

import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:ditonton/domain/usecases/tvshow/get_tv_show_detail.dart';
import 'package:ditonton/domain/usecases/tvshow/get_tv_show_watchlist_status.dart';
import 'package:ditonton/domain/usecases/tvshow/remove_tv_show_watchlist.dart';
import 'package:ditonton/domain/usecases/tvshow/save_tv_show_watchlist.dart';
import 'package:ditonton/injection.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/tv_show.dart';
import '../../domain/usecases/tvshow/get_tv_recommendation.dart';

class TVShowDetailNotifier extends ChangeNotifier {
  //WATCHLIST
  late final GetTVShowWatchlistStatus _getWatchlistStatus;
  late final SaveTVShowWatchlist _saveWatchlist;
  late final RemoveTVShowWatchlist _removeWatchlist;
  late final GetTvRecommendations _getRecommendations;
  late final GetTVShowDetail _getDetail;

  TVShowDetailNotifier({
    GetTVShowWatchlistStatus? getWatchlistStatus,
    SaveTVShowWatchlist? saveWatchlist,
    RemoveTVShowWatchlist? removeWatchlist,
    GetTvRecommendations? getRecommendations,
    GetTVShowDetail? getDetail,
  }) {
    _getWatchlistStatus = getWatchlistStatus ?? locator();
    _saveWatchlist = saveWatchlist ?? locator();
    _removeWatchlist = removeWatchlist ?? locator();
    _getRecommendations = getRecommendations ?? locator();
    _getDetail = getDetail ?? locator();
  }

  late TVShowDetail tv;
  List<TVShow> recommendations = [];

  static const String watchlistAddSuccessMessage =
      'Tv series added to watchlist successfully';
  static const String watchlistRemoveSuccessMessage =
      'Tv series removed from watchlist successfully';

  RequestState detailState = RequestState.Empty;
  RequestState recommendationsState = RequestState.Empty;
  bool isAddedToWatchlist = false;
  String message = '';
  String watchlistMessage = '';

  Future<void> fetchDetail(int id) async {
    detailState = RequestState.Loading;
    final result = await _getDetail(id);

    result.fold(
      (fail) {
        detailState = RequestState.Error;
        message = fail.message;
      },
      (tvShow) async {
        detailState = RequestState.Loaded;
        tv = tvShow;
        await checkWatchlistStatus();
      },
    );

    notifyListeners();
  }

  Future<void> fetchRecommendations(int id) async {
    recommendationsState = RequestState.Loading;
    final res = await _getRecommendations(id);
    res.fold(
      (fail) {
        recommendationsState = RequestState.Error;
      },
      (tvShowList) {
        recommendations = tvShowList;
        recommendationsState = RequestState.Loaded;
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
