import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/typealias.dart';

import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class SearchTvShows {
  final TvShowRepository repository;

  SearchTvShows(this.repository);

  TvShowsOrFailureFuture call(String query) {
    if (query.isEmpty) {
      return Future.value(Left(ArgumentFailure("Empty Query")));
    }
    return repository.searchTvShows(query);
  }
}
