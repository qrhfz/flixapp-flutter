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
  RequestState detailState = RequestState.Empty;

  late TvShowDetail tv;
  String message = '';
  final GetTvShowDetail getDetail = locator.get();

  List<TvShow> recommendations = [];
  RequestState recommendationsState = RequestState.Empty;
  final _getRecommendations = locator.get<GetTvRecommendations>();

  //WATCHLIST
  final GetTvShowWatchlistStatus _getWatchlistStatus = locator();
  final SaveTvShowWatchlist _saveWatchlist = locator();
  final RemoveTvShowWatchlist _removeWatchlist = locator();
  String watchlistMessage = '';

  static const String watchlistAddSuccessMessage =
      'Tv series added to watchlist successfully';
  static const String watchlistRemoveSuccessMessage =
      'Tv series removed from watchlist successfully';

  bool isAddedToWatchlist = false;

  void fetchDetail(int id) async {
    detailState = RequestState.Loading;
    final result = await getDetail(id);

    result.fold((l) {
      detailState = RequestState.Error;
      message = l.message;
    }, (r) {
      detailState = RequestState.Loaded;

      tv = r;
      checkWatchlistStatus(tv.id);
    });

    notifyListeners();
  }

  void fetchRecommendations(int id) async {
    log('recommendations' + recommendationsState.toString(),
        name: 'recommendation');
    recommendationsState = RequestState.Loading;
    final res = await _getRecommendations(id);
    res.fold(
      (l) {
        recommendationsState = RequestState.Error;
        log('recommendations fail' + recommendationsState.toString(),
            name: 'recommendation');
      },
      (r) {
        recommendations = r;
        recommendationsState = RequestState.Loaded;
        log('recommendations success' + recommendationsState.toString(),
            name: 'recommendation');
      },
    );

    notifyListeners();
    log('notify recommendations' + recommendationsState.toString(),
        name: 'recommendation');
  }

  Future<void> addWatchlist(TvShowDetail tv) async {
    final result = await _saveWatchlist(tv);
    result.fold(
      (fail) {
        watchlistMessage = fail.message;
      },
      (message) {
        watchlistMessage = watchlistAddSuccessMessage;
      },
    );
    checkWatchlistStatus(tv.id);
    notifyListeners();
  }

  Future<void> removeFromWatchlist(TvShowDetail tv) async {
    final result = await _removeWatchlist(tv.id);
    result.fold(
      (fail) {
        watchlistMessage = fail.message;
      },
      (message) {
        watchlistMessage = watchlistRemoveSuccessMessage;
      },
    );
    checkWatchlistStatus(tv.id);
  }

  Future<void> checkWatchlistStatus(int id) async {
    isAddedToWatchlist = await _getWatchlistStatus(tv.id);
    notifyListeners();
  }
}
