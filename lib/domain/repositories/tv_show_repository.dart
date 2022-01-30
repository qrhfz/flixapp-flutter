import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';

abstract class TvShowRepository {
  TvShowsOrFailureFuture getPopularTvShows();
  TvShowsOrFailureFuture getTopRatedTvShows();
  TvShowsOrFailureFuture getAiringTvShows();
  TvShowDetailOrFailureFuture getTvShowDetail(int id);
  TvShowsOrFailureFuture searchTvShows(String query);
  TvShowsOrFailureFuture getTvShowWatchlist();
  Future<Either<Failure, String>> saveWatchlist(TvShowDetail tv);
  Future<Either<Failure, String>> removeWatchlist(int id);
  Future<bool> getWatchlistStatus(int id);
}
