import 'package:dartz/dartz.dart';
import 'package:ditonton/presentation/utils/state_enum.dart';
import 'package:domain/domain.dart';
import 'package:ditonton/presentation/provider/tv_show_detail_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_object.dart';
import 'tv_show_detail_notifier_test.mocks.dart';

@GenerateMocks([
  GetTVShowDetail,
  SaveTVShowWatchlist,
  RemoveTVShowWatchlist,
  GetTVShowWatchlistStatus,
  GetTvRecommendations,
])
void main() {
  final GetTVShowDetail getDetail = MockGetTVShowDetail();
  final GetTvRecommendations getRecommendations = MockGetTvRecommendations();
  final GetTVShowWatchlistStatus getWatchlistStatus =
      MockGetTVShowWatchlistStatus();
  final SaveTVShowWatchlist saveWatchlist = MockSaveTVShowWatchlist();
  final RemoveTVShowWatchlist removeWatchlist = MockRemoveTVShowWatchlist();

  final notifier = TVShowDetailNotifier(
    getDetail: getDetail,
    getRecommendations: getRecommendations,
    getWatchlistStatus: getWatchlistStatus,
    saveWatchlist: saveWatchlist,
    removeWatchlist: removeWatchlist,
  );

  group('get tv detail', () {
    test('initial detail state should be Empty', () {
      expect(notifier.detailState, RequestState.Empty);
    });

    test('should change tvdetail data after fetching data through usecase',
        () async {
      when(getDetail(1)).thenAnswer((_) async => Right(testTvShowDetail));
      when(getWatchlistStatus(1)).thenAnswer((_) async => true);
      await notifier.fetchDetail(1);
      expect(notifier.tv, testTvShowDetail);
    });

    test('should change state to Loaded after data is successfully fetched',
        () async {
      when(getDetail(1)).thenAnswer((_) async => Right(testTvShowDetail));
      when(getWatchlistStatus(1)).thenAnswer((_) async => true);
      await notifier.fetchDetail(1);
      expect(notifier.detailState, RequestState.Loaded);
    });

    test('should change state to Error if data is failed to be fetched',
        () async {
      when(getDetail(1)).thenAnswer((_) async => Left(ConnectionFailure()));
      await notifier.fetchDetail(1);
      expect(notifier.detailState, RequestState.Error);
    });
  });

  group('get tv recommendations', () {
    test('initial detail state should be Empty', () {
      expect(notifier.recommendationsState, RequestState.Empty);
    });

    test('should change tvdetail data after fetching data through usecase',
        () async {
      when(getRecommendations(1)).thenAnswer((_) async => Right([testTvShow]));
      await notifier.fetchRecommendations(1);
      expect(notifier.recommendations, [testTvShow]);
    });

    test('should change state to Loaded after data is successfully fetched',
        () async {
      when(getRecommendations(1)).thenAnswer((_) async => Right([testTvShow]));
      await notifier.fetchRecommendations(1);
      expect(notifier.recommendationsState, RequestState.Loaded);
    });

    test('should change state to Error if data is failed to be fetched',
        () async {
      when(getRecommendations(1))
          .thenAnswer((_) async => Left(ConnectionFailure()));
      await notifier.fetchRecommendations(1);
      expect(notifier.recommendationsState, RequestState.Error);
    });
  });

  group('watchlist', () {
    test('get watchlist status should change isAddedToWatchlist', () async {
      when(getDetail(1)).thenAnswer((_) async => Right(testTvShowDetail));
      when(getWatchlistStatus(1)).thenAnswer((_) async => true);
      await notifier.fetchDetail(1);
      await notifier.checkWatchlistStatus();

      expect(notifier.isAddedToWatchlist, true);
    });
    test('add to watchlist should change message', () async {
      when(getDetail(1)).thenAnswer((_) async => Right(testTvShowDetail));
      await notifier.fetchDetail(1);

      when(getWatchlistStatus(1)).thenAnswer((_) async => true);
      when(saveWatchlist(testTvShowDetail))
          .thenAnswer((_) async => Right('success'));
      await notifier.addWatchlist();

      expect(notifier.watchlistMessage,
          TVShowDetailNotifier.watchlistAddSuccessMessage);
      expect(notifier.isAddedToWatchlist, true);
    });

    test('add to watchlist failure should change message', () async {
      when(getDetail(1)).thenAnswer((_) async => Right(testTvShowDetail));
      await notifier.fetchDetail(1);

      when(getWatchlistStatus(1)).thenAnswer((_) async => false);
      when(saveWatchlist(testTvShowDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('error')));
      await notifier.addWatchlist();

      expect(notifier.watchlistMessage, 'error');
    });

    test('remove from watchlist should change message', () async {
      when(getDetail(1)).thenAnswer((_) async => Right(testTvShowDetail));
      await notifier.fetchDetail(1);

      when(getWatchlistStatus(1)).thenAnswer((_) async => false);
      when(removeWatchlist(1)).thenAnswer((_) async => Right('success'));
      await notifier.removeFromWatchlist();

      expect(notifier.watchlistMessage,
          TVShowDetailNotifier.watchlistRemoveSuccessMessage);
      expect(notifier.isAddedToWatchlist, false);
    });

    test('remove from watchlist failure should change message', () async {
      when(getDetail(1)).thenAnswer((_) async => Right(testTvShowDetail));
      await notifier.fetchDetail(1);

      when(getWatchlistStatus(1)).thenAnswer((_) async => false);
      when(removeWatchlist(1))
          .thenAnswer((_) async => Left(DatabaseFailure('error')));
      await notifier.removeFromWatchlist();

      expect(notifier.watchlistMessage, 'error');
    });
  });
}
