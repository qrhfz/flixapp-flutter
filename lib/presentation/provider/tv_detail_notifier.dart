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

class TvDetailNotifier extends ChangeNotifier {
  //WATCHLIST
  late final GetTvShowWatchlistStatus _getWatchlistStatus;
  late final SaveTvShowWatchlist _saveWatchlist;
  late final RemoveTvShowWatchlist _removeWatchlist;
  late final GetTvRecommendations _getRecommendations;
  late final GetTvShowDetail _getDetail;

  TvDetailNotifier({
    GetTvShowWatchlistStatus? getWatchlistStatus,
    SaveTvShowWatchlist? saveWatchlist,
    RemoveTvShowWatchlist? removeWatchlist,
    GetTvRecommendations? getRecommendations,
    GetTvShowDetail? getDetail,
  }) {
    _getWatchlistStatus = getWatchlistStatus ?? locator();
    _saveWatchlist = saveWatchlist ?? locator();
    _removeWatchlist = removeWatchlist ?? locator();
    _getRecommendations = getRecommendations ?? locator();
    _getDetail = getDetail ?? locator();
  }

  late TvShowDetail tv;
  List<TvShow> recommendations = [];

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

    result.fold((l) {
      detailState = RequestState.Error;
      message = l.message;
    }, (r) {
      detailState = RequestState.Loaded;

      tv = r;
    });

    notifyListeners();
  }

  Future<void> fetchRecommendations(int id) async {
    recommendationsState = RequestState.Loading;
    final res = await _getRecommendations(id);
    res.fold(
      (l) {
        recommendationsState = RequestState.Error;
      },
      (r) {
        recommendations = r;
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
    checkWatchlistStatus();
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
    checkWatchlistStatus();
  }

  Future<void> checkWatchlistStatus() async {
    isAddedToWatchlist = await _getWatchlistStatus(tv.id);
    notifyListeners();
  }
}
