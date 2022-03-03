import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:ditonton/presentation/cubit/movie_top_rated_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movie_top_rated_cubit_test.mocks.dart';

@GenerateMocks([GetTopRatedMovies])
void main() {
  late GetTopRatedMovies getTopRated;
  late MovieTopRatedCubit cubit;
  final List<Movie> movies = [];
  final fail = ConnectionFailure();

  setUp(() {
    getTopRated = MockGetTopRatedMovies();
    cubit = MovieTopRatedCubit(getTopRated);
  });

  group('fetch movies success', () {
    setUp(() {
      when(getTopRated.execute()).thenAnswer((_) async => Right(movies));
    });

    blocTest<MovieTopRatedCubit, MovieTopRatedState>(
      'fetching movies should emit loading and then data',
      build: () => cubit,
      act: (cubit) async => cubit.fetchTopRatedMovies(),
      expect: () => [
        MovieTopRatedState.loading(),
        MovieTopRatedState.data(movies),
      ],
    );
  });

  group('fetch movies failed', () {
    setUp(() {
      when(getTopRated.execute()).thenAnswer((_) async => Left(fail));
    });

    blocTest<MovieTopRatedCubit, MovieTopRatedState>(
      'fetching movies should emit loading and then data',
      build: () => cubit,
      act: (cubit) async => cubit.fetchTopRatedMovies(),
      expect: () => [
        MovieTopRatedState.loading(),
        MovieTopRatedState.error(fail.message),
      ],
    );
  });
}
