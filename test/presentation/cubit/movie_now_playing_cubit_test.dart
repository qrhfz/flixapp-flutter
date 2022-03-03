import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/utils/failure.dart';
import 'package:ditonton/domain/movie/entities/movie.dart';
import 'package:ditonton/domain/movie/usecase/get_now_playing_movies.dart';
import 'package:ditonton/presentation/cubit/movie_now_playing_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movie_now_playing_cubit_test.mocks.dart';

@GenerateMocks([GetNowPlayingMovies])
void main() {
  late MockGetNowPlayingMovies getAiring;
  late MovieNowPlayingCubit cubit;
  final List<Movie> movies = [];
  final fail = ConnectionFailure();

  setUp(() {
    getAiring = MockGetNowPlayingMovies();
    cubit = MovieNowPlayingCubit(getAiring);
  });

  group('fetch movies success', () {
    setUp(() {
      when(getAiring.execute()).thenAnswer((_) async => Right(movies));
    });

    blocTest<MovieNowPlayingCubit, MovieNowPlayingState>(
      'fetching movies should emit loading and then data',
      build: () => cubit,
      act: (cubit) async => cubit.fetchNowPlayingMovies(),
      expect: () => [
        MovieNowPlayingState.loading(),
        MovieNowPlayingState.data(movies),
      ],
    );
  });

  group('fetch movies failed', () {
    setUp(() {
      when(getAiring.execute()).thenAnswer((_) async => Left(fail));
    });

    blocTest<MovieNowPlayingCubit, MovieNowPlayingState>(
      'fetching movies should emit loading and then data',
      build: () => cubit,
      act: (cubit) async => cubit.fetchNowPlayingMovies(),
      expect: () => [
        MovieNowPlayingState.loading(),
        MovieNowPlayingState.error(fail.message),
      ],
    );
  });
}
