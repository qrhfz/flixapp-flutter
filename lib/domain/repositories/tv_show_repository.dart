import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_show.dart';

abstract class TvShowRepository {
  Future<Either<Failure, List<TvShow>>> getPopularTvShows();
  Future<Either<Failure, List<TvShow>>> getTopRatedTvShows();
  Future<Either<Failure, List<TvShow>>> getAiringTvShows();
  Future<Either<Failure, List<TvShow>>> getTvShowDetail(int id);
  Future<Either<Failure, List<TvShow>>> searchTvShows(String query);
  Future<Either<Failure, String>> saveWatchlist(TvShow tv);
  Future<Either<Failure, String>> deleteWatchlist(TvShow tv);
  Future<bool> isInWatchlist(int id);
}
