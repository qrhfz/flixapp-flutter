import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/utils/failure.dart';
import 'package:ditonton/presentation/utils/state_enum.dart';
import 'package:ditonton/domain/tv/usecases/get_tv_show_watchlist.dart';
import 'package:ditonton/presentation/provider/watchlist_tv_show_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'watchlist_tv_notifer_test.mocks.dart';

@GenerateMocks([GetTVShowWatchlist])
void main() {
  final usecase = MockGetTVShowWatchlist();
  final provider = WatchlistTVShowNotifier(getWatchlistTvShows: usecase);

  test('request state should be initialized as empty', () {
    expect(provider.watchlistState, RequestState.Empty);
  });

  group('fetching data success', () {
    setUp(() {
      when(usecase()).thenAnswer((_) async => Right([testTvShow]));
    });

    test('calling usecase should change the state to loading', () async {
      provider.fetchWatchlistTvShows();

      expect(provider.watchlistState, RequestState.Loading);
    });

    test('update state to be Loaded after usecase successfully called',
        () async {
      await provider.fetchWatchlistTvShows();

      expect(provider.watchlistState, RequestState.Loaded);
    });
    test('update watchlistTvShows after usecase successfully called', () async {
      await provider.fetchWatchlistTvShows();

      expect(provider.watchlistTvShows, [testTvShow]);
    });
  });

  group('fetching data fail', () {
    final fail = ConnectionFailure();
    setUp(() {
      when(usecase()).thenAnswer((_) async => Left(fail));
    });

    test('update state to be Error after usecase done being called', () async {
      await provider.fetchWatchlistTvShows();

      expect(provider.watchlistState, RequestState.Error);
    });
    test('update message after usecase successfully called', () async {
      await provider.fetchWatchlistTvShows();

      expect(provider.message, fail.message);
    });
  });
}
