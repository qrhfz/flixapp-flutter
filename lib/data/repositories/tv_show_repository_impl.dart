import 'package:ditonton/data/datasources/tv_local_data_source.dart';
import 'package:ditonton/data/datasources/tv_remote_data_source.dart';
import 'package:ditonton/data/models/tv_show_table.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class TvShowRepositoryImpl implements TvShowRepository {
  late final TvRemoteDataSource _remoteDataSource;
  late final TvLocalDataSource _localDataSource;

  TvShowRepositoryImpl(
      {required TvRemoteDataSource remoteDataSource,
      required TvLocalDataSource localDataSource}) {
    this._remoteDataSource = remoteDataSource;
    this._localDataSource = localDataSource;
  }

  @override
  TvShowsOrFailureFuture getAiringTvShows() async {
    final res = await _remoteDataSource.getAiringTvShows();
    final Either<Failure, List<TvShow>> tvShowEntities = res.fold(
      (l) => Left(l),
      (r) => Right(r.map((e) => e.toEntity()).toList()),
    );
    return tvShowEntities;
  }

  @override
  TvShowsOrFailureFuture getPopularTvShows() async {
    final res = await _remoteDataSource.getPopularTvShows();
    final Either<Failure, List<TvShow>> tvShowEntities = res.fold(
      (l) => Left(l),
      (r) => Right(r.map((e) => e.toEntity()).toList()),
    );
    return tvShowEntities;
  }

  @override
  TvShowsOrFailureFuture getTopRatedTvShows() async {
    final res = await _remoteDataSource.getTopRatedTvShows();
    final Either<Failure, List<TvShow>> tvShowEntities = res.fold(
      (l) => Left(l),
      (r) => Right(r.map((e) => e.toEntity()).toList()),
    );
    return tvShowEntities;
  }

  @override
  TvShowDetailOrFailureFuture getTvShowDetail(int id) async {
    final res = await _remoteDataSource.getTvShowDetail(id);
    final Either<Failure, TvShowDetail> tvShowEntity = res.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
    return tvShowEntity;
  }

  @override
  TvShowsOrFailureFuture searchTvShows(String query) async {
    final res = await _remoteDataSource.searchTvShow(query);
    final Either<Failure, List<TvShow>> tvShowEntities = res.fold(
      (l) => Left(l),
      (r) => Right(r.map((e) => e.toEntity()).toList()),
    );
    return tvShowEntities;
  }

  @override
  TvShowsOrFailureFuture getTvShowWatchlist() async {
    final tvShowTableEntities = await _localDataSource.getTvWatchlist();
    final Either<Failure, List<TvShow>> res = tvShowTableEntities.fold(
      (fail) => Left(fail),
      (tvShowTableRecords) {
        final tvShows = tvShowTableRecords.map((tvShow) {
          return TvShow(
            id: tvShow.id,
            title: tvShow.title,
            overview: tvShow.overview,
            posterPath: tvShow.posterPath,
          );
        }).toList();
        return Right(tvShows);
      },
    );

    return res;
  }

  @override
  Future<bool> getWatchlistStatus(int id) async {
    final res = await _localDataSource.getTvById(id);
    final tvShow = res.getOrElse(() => null);
    return tvShow != null;
  }

  @override
  Future<Either<Failure, String>> removeWatchlist(int id) =>
      _localDataSource.removeWatchlist(id);

  @override
  Future<Either<Failure, String>> saveWatchlist(TvShowDetail tv) {
    final record = TvShowTable(
      id: tv.id,
      title: tv.title,
      overview: tv.overview,
      posterPath: tv.posterPath,
    );
    return _localDataSource.insertWatchlist(record);
  }

  @override
  TvShowsOrFailureFuture getTvRecommendations(int id) async {
    final res = await _remoteDataSource.getTvShowRecommendations(id);
    final Either<Failure, List<TvShow>> tvShowEntities = res.fold(
      (l) => Left(l),
      (r) => Right(r.map((e) => e.toEntity()).toList()),
    );
    return tvShowEntities;
  }
}
