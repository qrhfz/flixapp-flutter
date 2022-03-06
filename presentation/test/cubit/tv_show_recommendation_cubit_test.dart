import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/presentation.dart';

import 'tv_show_recommendation_cubit_test.mocks.dart';

@GenerateMocks([GetTvRecommendations])
void main() {
  late TvShowRecommendationCubit cubit;
  late GetTvRecommendations usecase;

  setUp(() {
    usecase = MockGetTvRecommendations();
    cubit = TvShowRecommendationCubit(usecase);
  });

  test('initial state should TvShowRecommendationState.initial()', () {
    expect(cubit.state, const TvShowRecommendationState.initial());
  });

  blocTest<TvShowRecommendationCubit, TvShowRecommendationState>(
    'successful fetchRecommendation should emit loading and then data state',
    setUp: () {
      when(usecase(1)).thenAnswer((_) async => const Right(<TVShow>[]));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchRecommendation(1),
    expect: () => const [
      TvShowRecommendationState.loading(),
      TvShowRecommendationState.data(<TVShow>[]),
    ],
  );

  blocTest<TvShowRecommendationCubit, TvShowRecommendationState>(
    'failed fetchRecommendation should emit loading and then data state',
    setUp: () {
      when(usecase(1))
          .thenAnswer((_) async => const Left(ConnectionFailure('error')));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchRecommendation(1),
    expect: () => const [
      TvShowRecommendationState.loading(),
      TvShowRecommendationState.error('error'),
    ],
  );
}
