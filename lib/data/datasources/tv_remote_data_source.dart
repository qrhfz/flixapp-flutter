import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_list_item.dart';

abstract class TvRemoteDataSource {
  Future<Either<Failure, List<TvListItem>>> getPopularTvSeries();
  Future<Either<Failure, List<TvListItem>>> getTopRatedTvSeries();
  Future<Either<Failure, List<TvListItem>>> getAiringTvSeries();
  Future<Either<Failure, List<TvListItem>>> getTvSeriesDetail(int id);
  Future<Either<Failure, List<TvListItem>>> searchTvSeriesDetail(String query);
}
