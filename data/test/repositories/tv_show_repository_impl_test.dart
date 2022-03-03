import 'package:dartz/dartz.dart';
import 'package:data/datasources/tv_local_data_source.dart';
import 'package:data/datasources/tv_remote_data_source.dart';
import 'package:data/models/tv_show_detail_model.dart';
import 'package:data/models/tv_show_model.dart';
import 'package:data/models/tv_show_table.dart';
import 'package:data/repositories/tv_show_repository_impl.dart';

import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../dummy_data/dummy_objects.dart';
import '../dummy_object.dart';
import 'tv_show_repository_impl_test.mocks.dart';

@GenerateMocks([TVShowRemoteDataSource, TVShowLocalDataSource])
void main() {
  final TVShowRemoteDataSource remoteDataSource = MockTVShowRemoteDataSource();
  final TVShowLocalDataSource localDataSource = MockTVShowLocalDataSource();
  final TVShowRepository repository = TvShowRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );

  const tTvShowModel = TVShowModel(
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

  const tTvShow = TVShow(
    id: 1,
    overview: 'overview',
    posterPath: 'posterPath',
    title: 'title',
  );
  final List<TVShow> tTvShowList = [tTvShow];

  group('Tv show repository', () {
    test('getPopularTvShows should return list of tv show', () async {
      when(remoteDataSource.getPopularTvShows())
          .thenAnswer((_) async => Right(tTvShowModelList));

      final res = await repository.getPopularTVShows();
      final data = res.getOrElse(() => []);
      expect(data, tTvShowList);
    });

    test('getPopularTvShows should return Failure when error happens',
        () async {
      when(remoteDataSource.getPopularTvShows())
          .thenAnswer((_) async => const Left(ConnectionFailure()));

      final res = await repository.getPopularTVShows();
      expect(res, const Left(ConnectionFailure()));
    });
    test('getAiringTvShows should return list of tv show', () async {
      when(remoteDataSource.getAiringTvShows())
          .thenAnswer((_) async => Right(tTvShowModelList));

      final res = await repository.getAiringTVShows();
      final data = res.getOrElse(() => []);
      expect(data, tTvShowList);
    });

    test('getAiringTvShows should return failure when error happens', () async {
      when(remoteDataSource.getAiringTvShows())
          .thenAnswer((_) async => const Left(ConnectionFailure()));

      final res = await repository.getAiringTVShows();
      expect(res, const Left(ConnectionFailure()));
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
          .thenAnswer((_) async => const Left(ConnectionFailure()));

      final res = await repository.getTopRatedTvShows();
      expect(res, const Left(ConnectionFailure()));
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
          .thenAnswer((_) async => const Left(ConnectionFailure()));

      final res = await repository.searchTvShows('test');
      expect(res, const Left(ConnectionFailure()));
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
          .thenAnswer((_) async => const Left(ConnectionFailure()));

      final res = await repository.getTvRecommendations(1);
      expect(res, const Left(ConnectionFailure()));
    });
    test('getTvShowDetail should return tv show detail object', () async {
      const tModel = TVShowDetailModel(
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

      const tEntity = TVShowDetail(
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
          .thenAnswer((_) async => const Right(tModel));
      final Either<Failure, TVShowDetail> res =
          await repository.getTvShowDetail(1);
      expect(res, const Right(tEntity));
    });
    test('getTvShowDetail error should return a failure', () async {
      when(remoteDataSource.getTvShowDetail(1))
          .thenAnswer((_) async => const Left(ConnectionFailure()));
      final Either<Failure, TVShowDetail> res =
          await repository.getTvShowDetail(1);
      expect(res, const Left(ConnectionFailure()));
    });
    test('getTvShowWatchlist should return list of tv show', () async {
      when(localDataSource.getTvWatchlist())
          .thenAnswer((_) async => const Right(<TVShowTable>[]));
      final res = await repository.getTvShowWatchlist();
      final data = res.getOrElse(() => []);

      expect(data, <TVShow>[]);
    });

    test('getTvShowWatchlist error should return a failure', () async {
      const failure = DatabaseFailure('');
      when(localDataSource.getTvWatchlist())
          .thenAnswer((_) async => const Left(failure));
      final res = await repository.getTvShowWatchlist();

      expect(res, const Left(failure));
    });
    test('saveWatchlist should return string message', () async {
      when(localDataSource.insertWatchlist(testTvShowTable))
          .thenAnswer((_) async => const Right('success'));
      final res = await repository.saveWatchlist(testTvShowDetail);
      expect(res, const Right('success'));
    });

    test('saveWatchlist error should return a failure', () async {
      const fail = DatabaseFailure('db failure');
      when(localDataSource.insertWatchlist(testTvShowTable))
          .thenAnswer((_) async => const Left(fail));
      final res = await repository.saveWatchlist(testTvShowDetail);
      expect(res, const Left(fail));
    });
    test('isInWatchlist should return boolean', () async {
      when(localDataSource.getTvById(1))
          .thenAnswer((_) async => const Right(testTvShowTable));
      final res = await repository.getWatchlistStatus(1);
      expect(res, true);
    });

    test('isInWatchlist error should return false', () async {
      const fail = DatabaseFailure('db failure');
      when(localDataSource.getTvById(1))
          .thenAnswer((_) async => const Left(fail));
      final res = await repository.getWatchlistStatus(1);
      expect(res, false);
    });

    test('deleteWatchlist return string message', () async {
      when(localDataSource.removeWatchlist(1))
          .thenAnswer((_) async => const Right('success'));
      final res = await repository.removeWatchlist(1);
      expect(res, const Right('success'));
    });

    test('deleteWatchlist error should return a Failure', () async {
      const fail = DatabaseFailure('db failure');
      when(localDataSource.removeWatchlist(1))
          .thenAnswer((_) async => const Left(fail));
      final res = await repository.removeWatchlist(1);
      expect(res, const Left(fail));
    });
  });
}
