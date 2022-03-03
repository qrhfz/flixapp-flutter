import 'package:dartz/dartz.dart';

import 'package:presentation/helper/state_enum.dart';

import 'package:presentation/provider/watchlist_tv_show_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:domain/domain.dart';
import '../dummy_object.dart';
import 'watchlist_tv_notifer_test.mocks.dart';

@GenerateMocks([GetTVShowWatchlist])
void main() {
  final usecase = MockGetTVShowWatchlist();
  final provider = WatchlistTVShowNotifier(usecase);

  test('request state should be initialized as empty', () {
    expect(provider.watchlistState, RequestState.empty);
  });

  group('fetching data success', () {
    setUp(() {
      when(usecase()).thenAnswer((_) async => const Right([testTvShow]));
    });

    test('calling usecase should change the state to loading', () async {
      provider.fetchWatchlistTvShows();

      expect(provider.watchlistState, RequestState.loading);
    });

    test('update state to be Loaded after usecase successfully called',
        () async {
      await provider.fetchWatchlistTvShows();

      expect(provider.watchlistState, RequestState.loaded);
    });
    test('update watchlistTvShows after usecase successfully called', () async {
      await provider.fetchWatchlistTvShows();

      expect(provider.watchlistTvShows, [testTvShow]);
    });
  });

  group('fetching data fail', () {
    const fail = ConnectionFailure();
    setUp(() {
      when(usecase()).thenAnswer((_) async => const Left(fail));
    });

    test('update state to be Error after usecase done being called', () async {
      await provider.fetchWatchlistTvShows();

      expect(provider.watchlistState, RequestState.error);
    });
    test('update message after usecase successfully called', () async {
      await provider.fetchWatchlistTvShows();

      expect(provider.message, fail.message);
    });
  });
}
