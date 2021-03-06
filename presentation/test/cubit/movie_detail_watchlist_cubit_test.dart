import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/cubit/movie_detail_watchlist_cubit.dart';

import '../dummy_object.dart';
import 'movie_detail_watchlist_cubit_test.mocks.dart';

@GenerateMocks([GetWatchListStatus, SaveWatchlist, RemoveWatchlist])
void main() {
  late MovieDetailWatchlistCubit cubit;
  late GetWatchListStatus getWatchListStatus;
  late SaveWatchlist saveWatchlist;
  late RemoveWatchlist removeWatchlist;

  setUp(() {
    getWatchListStatus = MockGetWatchListStatus();
    saveWatchlist = MockSaveWatchlist();
    removeWatchlist = MockRemoveWatchlist();
    cubit = MovieDetailWatchlistCubit(
      getWatchListStatus: getWatchListStatus,
      saveWatchlist: saveWatchlist,
      removeWatchlist: removeWatchlist,
    );
  });

  test('initial state should be MovieDetailWatchlistState.data(false)', () {
    expect(cubit.state, const MovieDetailWatchlistState.data(false));
  });
  blocTest<MovieDetailWatchlistCubit, MovieDetailWatchlistState>(
    'load watchlist status should emit data',
    setUp: () {
      when(getWatchListStatus.execute(1)).thenAnswer((_) async => true);
    },
    build: () => cubit,
    act: (cubit) => cubit.loadWatchlistStatus(1),
    expect: () => [const MovieDetailWatchlistState.data(true)],
  );
  blocTest<MovieDetailWatchlistCubit, MovieDetailWatchlistState>(
    'save watchlist should emit success state and call load watchlist to emit state data',
    setUp: () {
      when(saveWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => const Right('success'));
      when(getWatchListStatus.execute(1)).thenAnswer((_) async => true);
    },
    build: () => cubit,
    act: (cubit) => cubit.addWatchlist(testMovieDetail),
    expect: () => [
      const MovieDetailWatchlistState.success('success'),
      const MovieDetailWatchlistState.data(true),
    ],
  );
  blocTest<MovieDetailWatchlistCubit, MovieDetailWatchlistState>(
    'failing to save watchlist should emit error state and call load watchlist to emit state data',
    setUp: () {
      when(saveWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => const Left(DatabaseFailure('error')));
      when(getWatchListStatus.execute(1)).thenAnswer((_) async => false);
    },
    build: () => cubit,
    act: (cubit) => cubit.addWatchlist(testMovieDetail),
    expect: () => [
      const MovieDetailWatchlistState.error('error'),
      const MovieDetailWatchlistState.data(false),
    ],
  );
  blocTest<MovieDetailWatchlistCubit, MovieDetailWatchlistState>(
    'remove watchlist should emit success state and call load watchlist to emit state data',
    setUp: () {
      when(removeWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => const Right('success'));
      when(getWatchListStatus.execute(1)).thenAnswer((_) async => true);
    },
    build: () => cubit,
    act: (cubit) => cubit.removeFromWatchlist(testMovieDetail),
    expect: () => [
      const MovieDetailWatchlistState.success('success'),
      const MovieDetailWatchlistState.data(true),
    ],
  );
  blocTest<MovieDetailWatchlistCubit, MovieDetailWatchlistState>(
    'failing to remove watchlist should emit success state and call load watchlist to emit state data',
    setUp: () {
      when(removeWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => const Left(ConnectionFailure('error')));
      when(getWatchListStatus.execute(1)).thenAnswer((_) async => true);
    },
    build: () => cubit,
    act: (cubit) => cubit.removeFromWatchlist(testMovieDetail),
    expect: () => [
      const MovieDetailWatchlistState.error('error'),
      const MovieDetailWatchlistState.data(true),
    ],
  );
}
