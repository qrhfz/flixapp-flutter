import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/datasources/tv_local_data_source.dart';
import 'package:ditonton/data/datasources/tv_remote_data_source.dart';
import 'package:ditonton/data/models/tv_show_detail_model.dart';
import 'package:ditonton/data/models/tv_show_model.dart';
import 'package:ditonton/data/repositories/tv_show_repository_impl.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  final TvRemoteDataSource remoteDataSource = MockTvRemoteDataSource();
  final TvLocalDataSource localDataSource = MockTvLocalDataSource();
  final TvShowRepository repository =
      TvShowRepositoryImpl(remoteDataSource, localDataSource);

  final List<TvShowModel> testTvShowList = [];

  group('Tv show repository', () {
    test('getPopularTvShows should return list of tv show', () async {
      when(remoteDataSource.getPopularTvShows())
          .thenAnswer((_) async => Right(testTvShowList));

      final res = await repository.getPopularTvShows();
      assert(res is Right<Failure, List<TvShow>>);
    });
    test('getAiringTvShows should return list of tv show', () async {
      when(remoteDataSource.getAiringTvShows())
          .thenAnswer((_) async => Right(testTvShowList));

      final res = await repository.getAiringTvShows();
      assert(res is Right<Failure, List<TvShow>>);
    });
    test('getTopRatedTvShows should return list of tv show', () async {
      when(remoteDataSource.getTopRatedTvShows())
          .thenAnswer((_) async => Right(testTvShowList));

      final res = await repository.getTopRatedTvShows();
      assert(res is Right<Failure, List<TvShow>>);
    });
    test('searchTvShow should return list of tv show', () async {
      when(remoteDataSource.searchTvShow('test'))
          .thenAnswer((_) async => Right(testTvShowList));

      final res = await repository.searchTvShows('test');
      assert(res is Right<Failure, List<TvShow>>);
    });
    test('getTvShowDetail should return tv show detail object', () async {
      final testData = TvShowDetailModel(
        firstAirDate: DateTime(2022, 2, 2),
        genres: [],
        id: 1,
        lastAirDate: DateTime(2022, 2, 2),
        numberOfEpisodes: 1,
        numberOfSeasons: 1,
        originalTitle: '',
        overview: '',
        popularity: 1,
        title: '',
      );

      when(remoteDataSource.getTvShowDetail(1))
          .thenAnswer((_) async => Right(testData));
      final Either<Failure, TvShowDetail> res =
          await repository.getTvShowDetail(1);
      assert(res == Right<Failure, TvShowDetail>(testData.toEntity()));
    });
    test('getTvShowWatchlist should return list of tv show', () async {
      when(localDataSource.findAll()).thenAnswer((_) async => Right([]));
      final res = await repository.getTvShowWatchlist();
      assert(res is Right<Failure, List<TvShow>>);
    });
    test('saveWatchlist should return string message', () async {
      when(localDataSource.save(testTvShowTable))
          .thenAnswer((_) async => Right('success'));
      final res = await repository.saveWatchlist(testTvShowDetail);
      assert(res == Right<Failure, String>('success'));
    });
    test('isInWatchlist should return boolean', () async {
      when(localDataSource.findOneOrNull(1))
          .thenAnswer((_) async => Right(testTvShowTable));
      final res = await repository.getWatchlistStatus(1);
      assert(res == true);
    });
    test('deleteWatchlist return string message', () async {
      when(localDataSource.delete(1)).thenAnswer((_) async => Right('success'));
      final res = await repository.removeWatchlist(1);
      assert(res == Right<Failure, String>('success'));
    });
  });
}
