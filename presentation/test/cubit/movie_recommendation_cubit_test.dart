import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/cubit/movie_recommendation_cubit.dart';

import 'movie_recommendation_cubit_test.mocks.dart';

@GenerateMocks([GetMovieRecommendations])
void main() {
  late GetMovieRecommendations getRecommendation;
  late MovieRecommendationCubit cubit;
  final List<Movie> movies = [];
  const fail = ConnectionFailure();

  setUp(() {
    getRecommendation = MockGetMovieRecommendations();
    cubit = MovieRecommendationCubit(getRecommendation);
  });

  group('fetch movies success', () {
    setUp(() {
      when(getRecommendation.execute(1)).thenAnswer((_) async => Right(movies));
    });

    blocTest<MovieRecommendationCubit, MovieRecommendationState>(
      'fetching movies should emit loading and then data',
      build: () => cubit,
      act: (cubit) async => cubit.fetchRecommendations(1),
      expect: () => [
        const MovieRecommendationState.loading(),
        MovieRecommendationState.data(movies),
      ],
    );
  });

  group('fetch movies failed', () {
    setUp(() {
      when(getRecommendation.execute(1)).thenAnswer((_) async => const Left(fail));
    });

    blocTest<MovieRecommendationCubit, MovieRecommendationState>(
      'fetching movies should emit loading and then data',
      build: () => cubit,
      act: (cubit) async => cubit.fetchRecommendations(1),
      expect: () => [
        const MovieRecommendationState.loading(),
        MovieRecommendationState.error(fail.message),
      ],
    );
  });
}
