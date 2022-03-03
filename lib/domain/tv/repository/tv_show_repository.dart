import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/utils/failure.dart';
import 'package:ditonton/domain/utils/typealias.dart';
import 'package:ditonton/domain/tv/entities/tv_show_detail.dart';

abstract class TVShowRepository {
  TvShowsOrFailureFuture getPopularTVShows();
  TvShowsOrFailureFuture getTopRatedTvShows();
  TvShowsOrFailureFuture getAiringTVShows();
  TvShowDetailOrFailureFuture getTvShowDetail(int id);
  TvShowsOrFailureFuture searchTvShows(String query);
  TvShowsOrFailureFuture getTvShowWatchlist();
  Future<Either<Failure, String>> saveWatchlist(TVShowDetail tv);
  Future<Either<Failure, String>> removeWatchlist(int id);
  Future<bool> getWatchlistStatus(int id);
  TvShowsOrFailureFuture getTvRecommendations(int id);
}
