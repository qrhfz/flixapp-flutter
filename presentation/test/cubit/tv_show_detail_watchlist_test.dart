import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/presentation.dart';
import 'package:dartz/dartz.dart';
import '../dummy_object.dart';
import 'tv_show_detail_watchlist_test.mocks.dart';

@GenerateMocks([
  GetTVShowWatchlistStatus,
  SaveTVShowWatchlist,
  RemoveTVShowWatchlist,
])
void main() {
  late TvShowDetailWatchlistCubit cubit;
  late GetTVShowWatchlistStatus getTVShowWatchlistStatus;
  late SaveTVShowWatchlist saveTVShowWatchlist;
  late RemoveTVShowWatchlist removeTVShowWatchlist;

  setUp(() {
    getTVShowWatchlistStatus = MockGetTVShowWatchlistStatus();
    saveTVShowWatchlist = MockSaveTVShowWatchlist();
    removeTVShowWatchlist = MockRemoveTVShowWatchlist();
    cubit = TvShowDetailWatchlistCubit(
      getStatus: getTVShowWatchlistStatus,
      save: saveTVShowWatchlist,
      remove: removeTVShowWatchlist,
    );
  });

  test("cubit's inital state should be TvShowDetailWatchlistState.data(false)",
      () {
    expect(cubit.state, const TvShowDetailWatchlistState.data(false));
  });

  blocTest<TvShowDetailWatchlistCubit, TvShowDetailWatchlistState>(
    'loadWatchlistStatus should emit TvShowDetailWatchlistState.data',
    setUp: (() {
      when(getTVShowWatchlistStatus(1)).thenAnswer((_) async => false);
    }),
    build: () => cubit,
    act: (cubit) => cubit.loadWatchlistStatus(1),
    expect: () => const [TvShowDetailWatchlistState.data(false)],
  );

  group('saveWatchlist', () {
    blocTest<TvShowDetailWatchlistCubit, TvShowDetailWatchlistState>(
      'saveWatchlist should emit success state and then data',
      setUp: (() {
        when(getTVShowWatchlistStatus(1)).thenAnswer((_) async => true);
        when(saveTVShowWatchlist(testTvShowDetail))
            .thenAnswer((_) async => const Right('success'));
      }),
      build: () => cubit,
      act: (cubit) => cubit.saveWatchlist(testTvShowDetail),
      expect: () => const [
        TvShowDetailWatchlistState.success('success'),
        TvShowDetailWatchlistState.data(true),
      ],
    );
    blocTest<TvShowDetailWatchlistCubit, TvShowDetailWatchlistState>(
      'failed saveWatchlist should emit error and then data state',
      setUp: (() {
        when(getTVShowWatchlistStatus(1)).thenAnswer((_) async => false);
        when(saveTVShowWatchlist(testTvShowDetail))
            .thenAnswer((_) async => const Left(DatabaseFailure('error')));
      }),
      build: () => cubit,
      act: (cubit) => cubit.saveWatchlist(testTvShowDetail),
      expect: () => const [
        TvShowDetailWatchlistState.error('error'),
        TvShowDetailWatchlistState.data(false),
      ],
    );
  });

  group('removeWatchlist', () {
    blocTest<TvShowDetailWatchlistCubit, TvShowDetailWatchlistState>(
      'removeWatchlist should emit success and then data state',
      setUp: (() {
        when(getTVShowWatchlistStatus(1)).thenAnswer((_) async => true);
        when(removeTVShowWatchlist(1))
            .thenAnswer((_) async => const Right('success'));
      }),
      build: () => cubit,
      act: (cubit) => cubit.removeWatchlist(1),
      expect: () => const [
        TvShowDetailWatchlistState.success('success'),
        TvShowDetailWatchlistState.data(true),
      ],
    );
    blocTest<TvShowDetailWatchlistCubit, TvShowDetailWatchlistState>(
      'failed removeWatchlist should emit error and then data state',
      setUp: (() {
        when(getTVShowWatchlistStatus(1)).thenAnswer((_) async => true);
        when(removeTVShowWatchlist(1))
            .thenAnswer((_) async => const Left(DatabaseFailure('error')));
      }),
      build: () => cubit,
      act: (cubit) => cubit.removeWatchlist(1),
      expect: () => const [
        TvShowDetailWatchlistState.error('error'),
        TvShowDetailWatchlistState.data(true),
      ],
    );
  });
}
