import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/cubit/cubit.dart';

import 'tv_watchlist_test.mocks.dart';

@GenerateMocks([GetTVShowWatchlist])
void main() {
  late TvWatchlistCubit cubit;
  late GetTVShowWatchlist usecase;

  setUp(() {
    usecase = MockGetTVShowWatchlist();
    cubit = TvWatchlistCubit(usecase);
  });

  test('initial state should TvWatchlistState.initial()', () {
    expect(cubit.state, const TvWatchlistState.initial());
  });

  blocTest<TvWatchlistCubit, TvWatchlistState>(
    'successful fetch should emit loading and then data state',
    setUp: () {
      when(usecase()).thenAnswer((_) async => const Right(<TVShow>[]));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchWatchlist(),
    expect: () => const [
      TvWatchlistState.loading(),
      TvWatchlistState.data(<TVShow>[]),
    ],
  );

  blocTest<TvWatchlistCubit, TvWatchlistState>(
    'failed fetch should emit loading and then data state',
    setUp: () {
      when(usecase())
          .thenAnswer((_) async => const Left(ConnectionFailure('error')));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchWatchlist(),
    expect: () => const [
      TvWatchlistState.loading(),
      TvWatchlistState.error('error'),
    ],
  );
}
