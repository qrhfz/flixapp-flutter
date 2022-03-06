import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/presentation.dart';
import 'package:dartz/dartz.dart';
import 'tv_show_airing_cubit_test.mocks.dart';

@GenerateMocks([GetAiringTVShows])
void main() {
  late TvShowAiringCubit cubit;
  late MockGetAiringTVShows usecase;
  const failure = ConnectionFailure();

  setUp(() {
    usecase = MockGetAiringTVShows();
    cubit = TvShowAiringCubit(usecase);
  });

  test('initial state shoud be TvShowAiringState.initial()', () {
    expect(cubit.state, const TvShowAiringState.initial());
  });

  blocTest<TvShowAiringCubit, TvShowAiringState>(
    'successful fetchAiring should emit loading and then data state',
    build: () => cubit,
    setUp: () {
      when(usecase()).thenAnswer((_) async => const Right(<TVShow>[]));
    },
    act: (cubit) => cubit.fetchAiring(),
    expect: () => const [
      TvShowAiringState.loading(),
      TvShowAiringState.data(<TVShow>[]),
    ],
  );

  blocTest<TvShowAiringCubit, TvShowAiringState>(
    'failing fetchAiring should emit loading and then error state',
    build: () => cubit,
    setUp: () {
      when(usecase()).thenAnswer((_) async => const Left(failure));
    },
    act: (cubit) => cubit.fetchAiring(),
    expect: () => [
      const TvShowAiringState.loading(),
      TvShowAiringState.error(failure.message),
    ],
  );
}
