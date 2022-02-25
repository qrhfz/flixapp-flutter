import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/datasources/tv_local_data_source.dart';
import 'package:ditonton/data/datasources/tv_remote_data_source.dart';
import 'package:ditonton/data/models/tv_show_detail_model.dart';
import 'package:ditonton/data/models/tv_show_model.dart';
import 'package:ditonton/data/models/tv_show_table.dart';
import 'package:ditonton/data/repositories/tv_show_repository_impl.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  final TVShowRemoteDataSource remoteDataSource = MockTVShowRemoteDataSource();
  final TVShowLocalDataSource localDataSource = MockTVShowLocalDataSource();
  final TVShowRepository repository = TvShowRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );

  final tTvShowModel = TVShowModel(
    id: 1,
    genreIds: [],
    overview: 'overview',
    popularity: null,
    posterPath: 'posterPath',
    title: 'title',
    voteAverage: 1,
    voteCount: 1,
  );
  final List<TVShowModel> tTvShowModelList = [tTvShowModel];

  final tTvShow = TVShow(
    id: 1,
    overview: 'overview',
    posterPath: 'posterPath',
    title: 'title',
  );
  final List<TVShow> tTvShowList = [tTvShow];

  final TVShowTable tTVShowTable = TVShowTable(
    id: 1,
    overview: 'overview',
    posterPath: 'posterPath',
    title: 'title',
  );
  final tTVShowTableList = [tTVShowTable];
  group('Tv show repository', () {
    test('getPopularTvShows should return list of tv show', () async {
      when(remoteDataSource.getPopularTvShows())
          .thenAnswer((_) async => Right(tTvShowModelList));

      final res = await repository.getPopularTvShows();
      final data = res.getOrElse(() => []);
      expect(data, tTvShowList);
    });

    test('getPopularTvShows should return Failure when error happens',
        () async {
      when(remoteDataSource.getPopularTvShows())
          .thenAnswer((_) async => Left(ConnectionFailure()));

      final res = await repository.getPopularTvShows();
      expect(res, Left(ConnectionFailure()));
    });
    test('getAiringTvShows should return list of tv show', () async {
      when(remoteDataSource.getAiringTvShows())
          .thenAnswer((_) async => Right(tTvShowModelList));

      final res = await repository.getAiringTvShows();
      final data = res.getOrElse(() => []);
      expect(data, tTvShowList);
    });

    test('getAiringTvShows should return failure when error happens', () async {
      when(remoteDataSource.getAiringTvShows())
          .thenAnswer((_) async => Left(ConnectionFailure()));

      final res = await repository.getAiringTvShows();
      expect(res, Left(ConnectionFailure()));
    });
    test('getTopRatedTvShows should return list of tv show', () async {
      when(remoteDataSource.getTopRatedTvShows())
          .thenAnswer((_) async => Right(tTvShowModelList));

      final res = await repository.getTopRatedTvShows();
      final data = res.getOrElse(() => []);
      expect(data, tTvShowList);
    });
    test('getTopRatedTvShows should return failure when error happens',
        () async {
      when(remoteDataSource.getTopRatedTvShows())
          .thenAnswer((_) async => Left(ConnectionFailure()));

      final res = await repository.getTopRatedTvShows();
      expect(res, Left(ConnectionFailure()));
    });
    test('searchTvShow should return list of tv show', () async {
      when(remoteDataSource.searchTvShow('test'))
          .thenAnswer((_) async => Right(tTvShowModelList));

      final res = await repository.searchTvShows('test');
      final data = res.getOrElse(() => []);
      expect(data, tTvShowList);
    });

    test('searchTvShow error should return a failure', () async {
      when(remoteDataSource.searchTvShow('test'))
          .thenAnswer((_) async => Left(ConnectionFailure()));

      final res = await repository.searchTvShows('test');
      final data = res.getOrElse(() => []);
      expect(res, Left(ConnectionFailure()));
    });

    test('getTvShowRecommendations should return list of tv show', () async {
      when(remoteDataSource.getTvShowRecommendations(1))
          .thenAnswer((_) async => Right(tTvShowModelList));

      final res = await repository.getTvRecommendations(1);
      final data = res.getOrElse(() => []);
      expect(data, tTvShowList);
    });
    test('getTvShowRecommendations error should return a failure', () async {
      when(remoteDataSource.getTvShowRecommendations(1))
          .thenAnswer((_) async => Left(ConnectionFailure()));

      final res = await repository.getTvRecommendations(1);
      final data = res.getOrElse(() => []);
      expect(res, Left(ConnectionFailure()));
    });
    test('getTvShowDetail should return tv show detail object', () async {
      final tModel = TVShowDetailModel(
        genres: [],
        id: 1,
        numberOfEpisodes: 1,
        numberOfSeasons: 1,
        overview: '',
        popularity: 1,
        title: '',
        posterPath: '',
        voteAverage: 1,
        voteCount: 1,
      );

      final tEntity = TVShowDetail(
        genres: [],
        id: 1,
        numberOfEpisodes: 1,
        numberOfSeasons: 1,
        overview: '',
        popularity: 1,
        title: '',
        posterPath: '',
        voteAverage: 1,
        voteCount: 1,
      );

      when(remoteDataSource.getTvShowDetail(1))
          .thenAnswer((_) async => Right(tModel));
      final Either<Failure, TVShowDetail> res =
          await repository.getTvShowDetail(1);
      expect(res, Right(tEntity));
    });
    test('getTvShowDetail error should return a failure', () async {
      final tModel = TVShowDetailModel(
        genres: [],
        id: 1,
        numberOfEpisodes: 1,
        numberOfSeasons: 1,
        overview: '',
        popularity: 1,
        title: '',
        posterPath: '',
        voteAverage: 1,
        voteCount: 1,
      );

      when(remoteDataSource.getTvShowDetail(1))
          .thenAnswer((_) async => Left(ConnectionFailure()));
      final Either<Failure, TVShowDetail> res =
          await repository.getTvShowDetail(1);
      expect(res, Left(ConnectionFailure()));
    });
    test('getTvShowWatchlist should return list of tv show', () async {
      when(localDataSource.getTvWatchlist())
          .thenAnswer((_) async => Right(tTVShowTableList));
      final res = await repository.getTvShowWatchlist();
      final data = res.getOrElse(() => []);

      expect(data, tTvShowList);
    });

    test('getTvShowWatchlist error should return a failure', () async {
      final failure = DatabaseFailure('');
      when(localDataSource.getTvWatchlist())
          .thenAnswer((_) async => Left(failure));
      final res = await repository.getTvShowWatchlist();

      expect(res, Left(failure));
    });
    test('saveWatchlist should return string message', () async {
      when(localDataSource.insertWatchlist(testTvShowTable))
          .thenAnswer((_) async => Right('success'));
      final res = await repository.saveWatchlist(testTvShowDetail);
      expect(res, Right('success'));
    });

    test('saveWatchlist error should return a failure', () async {
      final fail = DatabaseFailure('db failure');
      when(localDataSource.insertWatchlist(testTvShowTable))
          .thenAnswer((_) async => Left(fail));
      final res = await repository.saveWatchlist(testTvShowDetail);
      expect(res, Left(fail));
    });
    test('isInWatchlist should return boolean', () async {
      when(localDataSource.getTvById(1))
          .thenAnswer((_) async => Right(testTvShowTable));
      final res = await repository.getWatchlistStatus(1);
      expect(res, true);
    });

    test('isInWatchlist error should return false', () async {
      final fail = DatabaseFailure('db failure');
      when(localDataSource.getTvById(1)).thenAnswer((_) async => Left(fail));
      final res = await repository.getWatchlistStatus(1);
      expect(res, false);
    });

    test('deleteWatchlist return string message', () async {
      when(localDataSource.removeWatchlist(1))
          .thenAnswer((_) async => Right('success'));
      final res = await repository.removeWatchlist(1);
      expect(res, Right('success'));
    });

    test('deleteWatchlist error should return a Failure', () async {
      final fail = DatabaseFailure('db failure');
      when(localDataSource.removeWatchlist(1))
          .thenAnswer((_) async => Left(fail));
      final res = await repository.removeWatchlist(1);
      expect(res, Left(fail));
    });
  });
}
