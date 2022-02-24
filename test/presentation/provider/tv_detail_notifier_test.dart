import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:ditonton/domain/usecases/tvshow/get_tv_recommendation.dart';
import 'package:ditonton/domain/usecases/tvshow/get_tv_show_detail.dart';
import 'package:ditonton/domain/usecases/tvshow/get_tv_show_watchlist_status.dart';
import 'package:ditonton/domain/usecases/tvshow/remove_tv_show_watchlist.dart';
import 'package:ditonton/domain/usecases/tvshow/save_tv_show_watchlist.dart';
import 'package:ditonton/presentation/provider/tv_detail_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_detail_notifier.mocks.dart';

@GenerateMocks([
  GetTvShowDetail,
  SaveTvShowWatchlist,
  RemoveTvShowWatchlist,
  GetTvShowWatchlistStatus,
  GetTvRecommendations,
])
void main() {
  final GetTvShowDetail getDetail = MockGetTvShowDetail();
  final GetTvRecommendations getRecommendations = MockGetTvRecommendations();
  final GetTvShowWatchlistStatus getWatchlistStatus =
      MockGetTvShowWatchlistStatus();
  final SaveTvShowWatchlist saveWatchlist = MockSaveTvShowWatchlist();
  final RemoveTvShowWatchlist removeWatchlist = MockRemoveTvShowWatchlist();

  final notifier = TvDetailNotifier(
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
      await notifier.fetchDetail(1);
      expect(notifier.tv, testTvShowDetail);
    });

    test('should change state to Loaded after data is successfully fetched',
        () async {
      when(getDetail(1)).thenAnswer((_) async => Right(testTvShowDetail));
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
}
