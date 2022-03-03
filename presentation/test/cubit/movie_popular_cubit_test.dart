import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/cubit/movie_popular_cubit.dart';

import 'movie_popular_cubit_test.mocks.dart';

@GenerateMocks([GetPopularMovies])
void main() {
  late MockGetPopularMovies getPopular;
  late MoviePopularCubit cubit;
  final List<Movie> movies = [];
  const fail = ConnectionFailure();

  setUp(() {
    getPopular = MockGetPopularMovies();
    cubit = MoviePopularCubit(getPopular);
  });

  group('fetch movies success', () {
    setUp(() {
      when(getPopular.execute()).thenAnswer((_) async => Right(movies));
    });

    blocTest<MoviePopularCubit, MoviePopularState>(
      'fetching movies should emit loading and then data',
      build: () => cubit,
      act: (cubit) async => cubit.fetchPopularMovies(),
      expect: () => [
        const MoviePopularState.loading(),
        MoviePopularState.data(movies),
      ],
    );
  });

  group('fetch movies failed', () {
    setUp(() {
      when(getPopular.execute()).thenAnswer((_) async => const Left(fail));
    });

    blocTest<MoviePopularCubit, MoviePopularState>(
      'fetching movies should emit loading and then data',
      build: () => cubit,
      act: (cubit) async => cubit.fetchPopularMovies(),
      expect: () => [
        const MoviePopularState.loading(),
        MoviePopularState.error(fail.message),
      ],
    );
  });
}
