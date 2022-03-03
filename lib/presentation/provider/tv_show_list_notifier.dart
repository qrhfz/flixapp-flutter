import 'package:ditonton/presentation/utils/state_enum.dart';
import 'package:domain/domain.dart';
import 'package:ditonton/injection.dart';
import 'package:flutter/foundation.dart';

class TVShowListNotifier extends ChangeNotifier {
  late final GetAiringTVShows getAiring;
  late final GetPopularTVShows getPopular;
  late final GetTopRatedTVShows getTopRated;

  RequestState _airingState = RequestState.Empty;
  RequestState get airingState => _airingState;
  RequestState _popularState = RequestState.Empty;
  RequestState get popularState => _popularState;
  RequestState _topRatedState = RequestState.Empty;
  RequestState get topRatedState => _topRatedState;

  List<TVShow> _airingList = [];
  List<TVShow> get airingList => _airingList;
  List<TVShow> _popularList = [];
  List<TVShow> get popularList => _popularList;
  List<TVShow> _topRatedList = [];
  List<TVShow> get topRatedList => _topRatedList;

  TVShowListNotifier([
    GetAiringTVShows? getAiring,
    GetPopularTVShows? getPopular,
    GetTopRatedTVShows? getTopRated,
  ]) {
    this.getAiring = getAiring ?? locator.get<GetAiringTVShows>();
    this.getPopular = getPopular ?? locator.get<GetPopularTVShows>();
    this.getTopRated = getTopRated ?? locator.get<GetTopRatedTVShows>();
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
