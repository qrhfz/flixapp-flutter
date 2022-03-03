import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/datasources/tv_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  final DatabaseHelper mockDatabaseHelper = MockDatabaseHelper();
  final TVShowLocalDataSource dataSource =
      TVShowLocalDataSourceImpl(mockDatabaseHelper);

  group('save tv watchlist', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.insertTvWatchlist(testTvShowTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.insertWatchlist(testTvShowTable);
      // assert
      expect(result, Right('Added to Watchlist'));
    });

    test('should return DatabaseFailure when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.insertTvWatchlist(testTvShowTable))
          .thenThrow(Exception());
      // act
      final call = await dataSource.insertWatchlist(testTvShowTable);
      // assert
      assert(call is Left<DatabaseFailure, String>);
    });
  });

  group('remove tv watchlist', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.removeTvWatchlist(1)).thenAnswer((_) async => 1);
      // act
      final result = await dataSource.removeWatchlist(1);
      // assert
      expect(result, Right('Removed from Watchlist'));
    });

    test('should return DatabaseFailure when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.removeTvWatchlist(1)).thenThrow(Exception());
      // act
      final call = await dataSource.removeWatchlist(1);
      // assert
      assert(call is Left<DatabaseFailure, String>);
    });
  });

  group('Get TvShowTable by Id', () {
    final tId = 1;

    test('should return Tv Show Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelper.getTvById(tId))
          .thenAnswer((_) async => testTvShowTable.toMap());
      // act
      final result = await dataSource.getTvById(tId);
      // assert
      expect(result, Right(testTvShowTable));
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelper.getTvById(tId)).thenAnswer((_) async => null);
      // act
      final result = await dataSource.getTvById(tId);
      // assert
      expect(result, Right(null));
    });
  });

  group('get watchlist tv', () {
    test('should return list of TvShowTable from database', () async {
      // arrange
      when(mockDatabaseHelper.getTvWatchlist())
          .thenAnswer((_) async => [testTvShowTable.toMap()]);
      // act
      final result = await dataSource.getTvWatchlist();
      // assert

      expect(
        result.getOrElse(() => throw Exception()),
        [testTvShowTable],
      );
    });
  });
}
