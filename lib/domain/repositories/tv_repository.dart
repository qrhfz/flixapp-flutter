import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv.dart';

abstract class TvRepository {
  Future<Either<Failure, List<Tv>>> getPopularTvSeries();
  Future<Either<Failure, List<Tv>>> getTopRatedTvSeries();
  Future<Either<Failure, List<Tv>>> getAiringTvSeries();
  Future<Either<Failure, List<Tv>>> getTvSeriesDetail(int id);
  Future<Either<Failure, List<Tv>>> searchTvSeriesDetail(String query);
}
