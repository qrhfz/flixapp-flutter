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
  final TvRemoteDataSource _remoteDataSource;
  final TvLocalDataSource _localDataSource;

  TvShowRepositoryImpl(this._remoteDataSource, this._localDataSource);
  @override
  FutureTvShowList getAiringTvShows() => _remoteDataSource.getAiringTvShows();

  @override
  FutureTvShowList getPopularTvShows() => _remoteDataSource.getPopularTvShows();

  @override
  FutureTvShowList getTopRatedTvShows() =>
      _remoteDataSource.getTopRatedTvShows();

  @override
  FutureTvShowDetail getTvShowDetail(int id) =>
      _remoteDataSource.getTvShowDetail(id);

  @override
  FutureTvShowList getTvShowWatchlist() async {
    final tvShowTableEntities = await _localDataSource.findAll();
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
    final res = await _localDataSource.findOneOrNull(id);
    final tvShow = res.getOrElse(() => null);
    return tvShow != null;
  }

  @override
  Future<Either<Failure, String>> removeWatchlist(int id) =>
      _localDataSource.delete(id);

  @override
  Future<Either<Failure, String>> saveWatchlist(TvShowDetail tv) {
    final record = TvShowTable(
      id: tv.id,
      title: tv.title,
      overview: tv.overview,
      posterPath: tv.posterPath,
    );
    return _localDataSource.save(record);
  }

  @override
  FutureTvShowList searchTvShows(String query) =>
      _remoteDataSource.searchTvShow(query);
}
