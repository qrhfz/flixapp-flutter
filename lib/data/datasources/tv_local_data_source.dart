import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/utils/failure.dart';
import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/models/tv_show_table.dart';

abstract class TVShowLocalDataSource {
  Future<Either<DatabaseFailure, List<TVShowTable>>> getTvWatchlist();
  Future<Either<DatabaseFailure, String>> insertWatchlist(TVShowTable tvShow);
  Future<Either<DatabaseFailure, String>> removeWatchlist(int id);
  Future<Either<DatabaseFailure, TVShowTable?>> getTvById(int id);
}

class TVShowLocalDataSourceImpl implements TVShowLocalDataSource {
  final DatabaseHelper _dbHelper;

  TVShowLocalDataSourceImpl(this._dbHelper);

  @override
  Future<Either<DatabaseFailure, TVShowTable?>> getTvById(int id) async {
    try {
      final tvMap = await _dbHelper.getTvById(id);
      if (tvMap == null) return Right(null);
      return Right(TVShowTable.fromMap(tvMap));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<DatabaseFailure, List<TVShowTable>>> getTvWatchlist() async {
    try {
      final tvMaps = await _dbHelper.getTvWatchlist();
      final tvList = tvMaps.map((map) => TVShowTable.fromMap(map)).toList();
      return Right(tvList);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<DatabaseFailure, String>> insertWatchlist(
      TVShowTable tvShow) async {
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
