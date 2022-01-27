import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/common/usecase.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class SearchTvShows extends UseCase<FutureTvShowList, SearchTvShowsParams> {
  final TvShowRepository repository;

  SearchTvShows(this.repository);
  @override
  execute(SearchTvShowsParams params) {
    if (params.query.isEmpty) {
      return Future.value(Left(ArgumentFailure("Empty Query")));
    }
    return repository.searchTvShows(params.query);
  }
}

class SearchTvShowsParams extends Params {
  final String query;

  SearchTvShowsParams(this.query);
}
