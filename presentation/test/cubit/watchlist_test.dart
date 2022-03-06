import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/cubit/cubit.dart';

import 'watchlist_test.mocks.dart';

@GenerateMocks([GetWatchlistMovies])
void main() {
  late WatchlistCubit cubit;
  late GetWatchlistMovies usecase;

  setUp(() {
    usecase = MockGetWatchlistMovies();
    cubit = WatchlistCubit(usecase);
  });

  test('initial state should WatchlistState.initial()', () {
    expect(cubit.state, const WatchlistState.initial());
  });

  blocTest<WatchlistCubit, WatchlistState>(
    'successful fetch should emit loading and then data state',
    setUp: () {
      when(usecase.execute()).thenAnswer((_) async => const Right(<Movie>[]));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchWatchlist(),
    expect: () => const [
      WatchlistState.loading(),
      WatchlistState.data(<Movie>[]),
    ],
  );

  blocTest<WatchlistCubit, WatchlistState>(
    'failed fetch should emit loading and then data state',
    setUp: () {
      when(usecase.execute())
          .thenAnswer((_) async => const Left(ConnectionFailure('error')));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchWatchlist(),
    expect: () => const [
      WatchlistState.loading(),
      WatchlistState.error('error'),
    ],
  );
}
