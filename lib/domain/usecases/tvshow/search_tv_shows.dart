import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/common/usecase.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class SearchTvShows extends UseCase<TvShowsOrFailureFuture, String> {
  final TvShowRepository repository;

  SearchTvShows(this.repository);
  @override
  execute(String query) {
    if (query.isEmpty) {
      return Future.value(Left(ArgumentFailure("Empty Query")));
    }
    return repository.searchTvShows(query);
  }
}
