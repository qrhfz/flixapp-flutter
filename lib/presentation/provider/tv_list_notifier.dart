import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/tvshow/get_top_rated_tv_shows.dart';
import 'package:ditonton/injection.dart';
import 'package:flutter/foundation.dart';

import 'package:ditonton/domain/usecases/tvshow/get_airing_tv_shows.dart';

import '../../domain/usecases/tvshow/get_popular_tv_shows.dart';

class TvListNotifier extends ChangeNotifier {
  late final GetAiringTvShows getAiring;
  late final GetPopularTvShows getPopular;
  late final GetTopRatedTvShows getTopRated;

  RequestState _airingState = RequestState.Empty;
  RequestState get airingState => _airingState;
  RequestState _popularState = RequestState.Empty;
  RequestState get popularState => _popularState;
  RequestState _topRatedState = RequestState.Empty;
  RequestState get topRatedState => _topRatedState;

  List<TvShow> _airingList = [];
  List<TvShow> get airingList => _airingList;
  List<TvShow> _popularList = [];
  List<TvShow> get popularList => _popularList;
  List<TvShow> _topRatedList = [];
  List<TvShow> get topRatedList => _topRatedList;

  TvListNotifier([
    GetAiringTvShows? getAiring,
    GetPopularTvShows? getPopular,
    GetTopRatedTvShows? getTopRated,
  ]) {
    this.getAiring = getAiring ?? locator.get<GetAiringTvShows>();
    this.getPopular = getPopular ?? locator.get<GetPopularTvShows>();
    this.getTopRated = getTopRated ?? locator.get<GetTopRatedTvShows>();
  }

  Future<void> fetchAiring() async {
    _airingState = RequestState.Loading;
    final result = await getAiring();

    result.fold((fail) {
      _airingState = RequestState.Error;
    }, (data) {
      _airingList = data;
    });
    notifyListeners();
  }

  Future<void> fetchPopular() async {
    _popularState = RequestState.Loading;
    final result = await getPopular();

    result.fold((fail) {
      _popularState = RequestState.Error;
    }, (data) {
      _popularList = data;
    });
    notifyListeners();
  }

  Future<void> fetchTopRated() async {
    _topRatedState = RequestState.Loading;
    final result = await getTopRated();

    result.fold((fail) {
      _topRatedState = RequestState.Error;
    }, (data) {
      _topRatedList = data;
    });
    notifyListeners();
  }
}
