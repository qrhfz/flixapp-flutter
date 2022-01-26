import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_show.dart';

abstract class TvRemoteDataSource {
  Future<Either<Failure, List<TvShow>>> getPopularTvSeries();
  Future<Either<Failure, List<TvShow>>> getTopRatedTvSeries();
  Future<Either<Failure, List<TvShow>>> getAiringTvSeries();
  Future<Either<Failure, List<TvShow>>> getTvSeriesDetail(int id);
  Future<Either<Failure, List<TvShow>>> searchTvSeriesDetail(String query);
}
