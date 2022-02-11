import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/models/tv_show_table.dart';

abstract class TvLocalDataSource {
  Future<Either<DatabaseFailure, List<TvShowTable>>> getTvWatchlist();
  Future<Either<DatabaseFailure, String>> insertWatchlist(TvShowTable tvShow);
  Future<Either<DatabaseFailure, String>> removeWatchlist(int id);
  Future<Either<DatabaseFailure, TvShowTable?>> getTvById(int id);
}

class TvLocalDataSourceImpl implements TvLocalDataSource {
  final DatabaseHelper _dbHelper;

  TvLocalDataSourceImpl(this._dbHelper);

  @override
  Future<Either<DatabaseFailure, TvShowTable?>> getTvById(int id) async {
    try {
      final tvMap = await _dbHelper.getTvById(id);
      if (tvMap == null) return Right(null);
      return Right(TvShowTable.fromMap(tvMap));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<DatabaseFailure, List<TvShowTable>>> getTvWatchlist() async {
    try {
      final tvMaps = await _dbHelper.getTvWatchlist();
      final tvList = tvMaps.map((map) => TvShowTable.fromMap(map)).toList();
      return Right(tvList);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<DatabaseFailure, String>> insertWatchlist(
      TvShowTable tvShow) async {
    try {
      await _dbHelper.insertTvWatchlist(tvShow);

      return Right('Added to Watchlist');
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<DatabaseFailure, String>> removeWatchlist(int id) async {
    try {
      await _dbHelper.removeTvWatchlist(id);

      return Right('Removed from Watchlist');
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
