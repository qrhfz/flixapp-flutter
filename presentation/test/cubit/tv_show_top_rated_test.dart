import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/cubit/cubit.dart';

import 'tv_show_top_rated_test.mocks.dart';

@GenerateMocks([GetTopRatedTVShows])
void main() {
  late TvShowTopRatedCubit cubit;
  late GetTopRatedTVShows usecase;

  setUp(() {
    usecase = MockGetTopRatedTVShows();
    cubit = TvShowTopRatedCubit(usecase);
  });

  test('initial state should TvShowTopRatedState.initial()', () {
    expect(cubit.state, const TvShowTopRatedState.initial());
  });

  blocTest<TvShowTopRatedCubit, TvShowTopRatedState>(
    'successful fetchTopRated should emit loading and then data state',
    setUp: () {
      when(usecase()).thenAnswer((_) async => const Right(<TVShow>[]));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchTopRated(),
    expect: () => const [
      TvShowTopRatedState.loading(),
      TvShowTopRatedState.data(<TVShow>[]),
    ],
  );

  blocTest<TvShowTopRatedCubit, TvShowTopRatedState>(
    'failed fetchTopRated should emit loading and then data state',
    setUp: () {
      when(usecase())
          .thenAnswer((_) async => const Left(ConnectionFailure('error')));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchTopRated(),
    expect: () => const [
      TvShowTopRatedState.loading(),
      TvShowTopRatedState.error('error'),
    ],
  );
}
