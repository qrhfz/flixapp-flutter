import 'package:dartz/dartz.dart';
import '../../utils/failure.dart';
import '../../utils/typealias.dart';
import '../repository/tv_show_repository.dart';

class SearchTVShows {
  final TVShowRepository repository;

  SearchTVShows(this.repository);

  TvShowsOrFailureFuture call(String query) {
    if (query.isEmpty) {
      return Future.value(const Left(ArgumentFailure("Empty Query")));
    }
    return repository.searchTvShows(query);
  }
}
