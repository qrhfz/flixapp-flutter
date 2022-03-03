import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/utils/failure.dart';
import 'package:ditonton/domain/utils/typealias.dart';

import 'package:ditonton/domain/tv/repository/tv_show_repository.dart';

class SearchTVShows {
  final TVShowRepository repository;

  SearchTVShows(this.repository);

  TvShowsOrFailureFuture call(String query) {
    if (query.isEmpty) {
      return Future.value(Left(ArgumentFailure("Empty Query")));
    }
    return repository.searchTvShows(query);
  }
}
