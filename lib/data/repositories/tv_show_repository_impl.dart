import 'package:ditonton/data/datasources/tv_local_data_source.dart';
import 'package:ditonton/data/datasources/tv_remote_data_source.dart';
import 'package:ditonton/data/models/tv_show_table.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class TvShowRepositoryImpl implements TVShowRepository {
  late final TVShowRemoteDataSource _remoteDataSource;
  late final TVShowLocalDataSource _localDataSource;

  TvShowRepositoryImpl(
      {required TVShowRemoteDataSource remoteDataSource,
      required TVShowLocalDataSource localDataSource}) {
    this._remoteDataSource = remoteDataSource;
    this._localDataSource = localDataSource;
  }

  @override
  TvShowsOrFailureFuture getAiringTvShows() async {
    final result = await _remoteDataSource.getAiringTvShows();
    final Either<Failure, List<TVShow>> tvShowEntities = result.fold(
      (fail) => Left(fail),
      (tvShowModels) =>
          Right(tvShowModels.map((model) => model.toEntity()).toList()),
    );
    return tvShowEntities;
  }

  @override
  TvShowsOrFailureFuture getPopularTvShows() async {
    final result = await _remoteDataSource.getPopularTvShows();
    final Either<Failure, List<TVShow>> tvShowEntities = result.fold(
      (fail) => Left(fail),
      (tvShowModels) =>
          Right(tvShowModels.map((model) => model.toEntity()).toList()),
    );
    return tvShowEntities;
  }

  @override
  TvShowsOrFailureFuture getTopRatedTvShows() async {
    final result = await _remoteDataSource.getTopRatedTvShows();
    final Either<Failure, List<TVShow>> tvShowEntities = result.fold(
      (fail) => Left(fail),
      (tvShowModels) =>
          Right(tvShowModels.map((model) => model.toEntity()).toList()),
    );
    return tvShowEntities;
  }

  @override
  TvShowDetailOrFailureFuture getTvShowDetail(int id) async {
    final result = await _remoteDataSource.getTvShowDetail(id);
    final Either<Failure, TVShowDetail> tvShowEntity = result.fold(
      (fail) => Left(fail),
      (model) => Right(model.toEntity()),
    );
    return tvShowEntity;
  }

  @override
  TvShowsOrFailureFuture searchTvShows(String query) async {
    final result = await _remoteDataSource.searchTvShow(query);
    final Either<Failure, List<TVShow>> tvShowEntities = result.fold(
      (fail) => Left(fail),
      (tvShowModels) =>
          Right(tvShowModels.map((model) => model.toEntity()).toList()),
    );
    return tvShowEntities;
  }

  @override
  TvShowsOrFailureFuture getTvShowWatchlist() async {
    final tvShowTableEntities = await _localDataSource.getTvWatchlist();
    final Either<Failure, List<TVShow>> result = tvShowTableEntities.fold(
      (fail) => Left(fail),
      (tvShowTableRecords) {
        final tvShows = tvShowTableRecords.map((tvShow) {
          return tvShow.toEntity();
        }).toList();
        return Right(tvShows);
      },
    );

    return result;
  }

  @override
  Future<bool> getWatchlistStatus(int id) async {
    final result = await _localDataSource.getTvById(id);
    final tvShow = result.getOrElse(() => null);
    return tvShow != null;
  }

  @override
  Future<Either<Failure, String>> removeWatchlist(int id) =>
      _localDataSource.removeWatchlist(id);

  @override
  Future<Either<Failure, String>> saveWatchlist(TVShowDetail tv) {
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
    final result = await _remoteDataSource.getTvShowRecommendations(id);
    final Either<Failure, List<TVShow>> tvShowEntities = result.fold(
      (fail) => Left(fail),
      (tvShowModels) =>
          Right(tvShowModels.map((model) => model.toEntity()).toList()),
    );
    return tvShowEntities;
  }
}
