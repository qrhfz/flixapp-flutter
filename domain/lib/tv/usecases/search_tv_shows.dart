import 'package:dartz/dartz.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import '../../utils/failure.dart';
import '../../utils/typealias.dart';
import '../repository/tv_show_repository.dart';

class SearchTVShows {
  late final FirebaseAnalytics? _analytics;
  final TVShowRepository _repository;

  SearchTVShows(this._repository, {FirebaseAnalytics? analytics}) {
    _analytics = analytics;
  }

  TvShowsOrFailureFuture call(String query) {
    if (query.isEmpty) {
      return Future.value(const Left(ArgumentFailure("Empty Query")));
    }
    _analytics?.logSearch(searchTerm: query);
    return _repository.searchTvShows(query);
  }
}
