import 'dart:developer';

import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:ditonton/domain/usecases/tvshow/get_tv_show_detail.dart';
import 'package:ditonton/injection.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/tv_show.dart';
import '../../domain/usecases/tvshow/get_tv_recommendation.dart';

class TvDetailNotifier extends ChangeNotifier {
  RequestState detailState = RequestState.Empty;
  RequestState recommendationState = RequestState.Empty;
  late TvShowDetail tv;
  String message = '';
  final GetTvShowDetail getDetail = locator.get();

  List<TvShow> recommendations = [];
  RequestState recommendationsState = RequestState.Empty;
  final getRecommendations = locator.get<GetTvRecommendations>();

  void fetchDetail(int id) async {
    detailState = RequestState.Loading;
    final result = await getDetail(id);

    result.fold((l) {
      detailState = RequestState.Error;
      message = l.message;
    }, (r) {
      detailState = RequestState.Loaded;
      return tv = r;
    });

    notifyListeners();
  }

  void fetchRecommendations(int id) async {
    log('recommendations');
    recommendationState = RequestState.Loading;
    final res = await getRecommendations(id);
    res.fold(
      (l) {
        log('recommendations fail');
        recommendationsState = RequestState.Error;
      },
      (r) {
        log('recommendations success');
        recommendations = r;
        recommendationsState = RequestState.Loaded;
      },
    );

    notifyListeners();
    log('notify recommendations');
  }
}
