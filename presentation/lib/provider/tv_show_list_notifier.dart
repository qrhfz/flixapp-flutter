import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import '../helper/state_enum.dart';

class TVShowListNotifier extends ChangeNotifier {
  late final GetAiringTVShows _getAiring;
  late final GetPopularTVShows _getPopular;
  late final GetTopRatedTVShows _getTopRated;

  RequestState _airingState = RequestState.empty;
  RequestState get airingState => _airingState;
  RequestState _popularState = RequestState.empty;
  RequestState get popularState => _popularState;
  RequestState _topRatedState = RequestState.empty;
  RequestState get topRatedState => _topRatedState;

  List<TVShow> _airingList = [];
  List<TVShow> get airingList => _airingList;
  List<TVShow> _popularList = [];
  List<TVShow> get popularList => _popularList;
  List<TVShow> _topRatedList = [];
  List<TVShow> get topRatedList => _topRatedList;

  TVShowListNotifier({
    required GetAiringTVShows getAiring,
    required GetPopularTVShows getPopular,
    required GetTopRatedTVShows getTopRated,
  }) {
    _getAiring = getAiring;
    _getPopular = getPopular;
    _getTopRated = getTopRated;
  }

  Future<void> fetchAiring() async {
    _airingState = RequestState.loading;
    final result = await _getAiring();

    result.fold((fail) {
      _airingState = RequestState.error;
    }, (data) {
      _airingList = data;
    });
    notifyListeners();
  }

  Future<void> fetchPopular() async {
    _popularState = RequestState.loading;
    final result = await _getPopular();

    result.fold((fail) {
      _popularState = RequestState.error;
    }, (data) {
      _popularList = data;
    });
    notifyListeners();
  }

  Future<void> fetchTopRated() async {
    _topRatedState = RequestState.loading;
    final result = await _getTopRated();

    result.fold((fail) {
      _topRatedState = RequestState.error;
    }, (data) {
      _topRatedList = data;
    });
    notifyListeners();
  }
}
