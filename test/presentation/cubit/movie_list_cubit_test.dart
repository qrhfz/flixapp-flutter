import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:ditonton/domain/usecases/movie/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:ditonton/presentation/cubit/movie_list_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movie_list_cubit_test.mocks.dart';

/// usecases:
/// GetAiringMovies
/// GetPopularMovies
/// GetTopRatedMovies
@GenerateMocks([GetNowPlayingMovies, GetPopularMovies, GetTopRatedMovies])
void main() {
  late MovieListCubit cubit;
  late MockGetNowPlayingMovies getAiring = MockGetNowPlayingMovies();
  late MockGetPopularMovies getPopular = MockGetPopularMovies();
  late MockGetTopRatedMovies getTopRated = MockGetTopRatedMovies();
  final List<Movie> movies = [];
  setUp(() {
    cubit = MovieListCubit(
      getNowPlaying: getAiring,
      getPopular: getPopular,
      getTopRated: getTopRated,
    );
  });

  test('initial state is MovieListState.initial', () {
    expect(cubit.state, MovieListState.initial());
  });

  group('fetch movies success', () {
    setUp(() {
      when(getTopRated.execute()).thenAnswer((_) async => Right(movies));
      when(getPopular.execute()).thenAnswer((_) async => Right(movies));
      when(getAiring.execute()).thenAnswer((_) async => Right(movies));
    });

    blocTest<MovieListCubit, MovieListState>(
      'fetch movies should emit loading and then data',
      build: () => cubit,
      act: (cubit) async => cubit.fetchMovies(),
      expect: () => [
        MovieListState.loading(),
        MovieListState.data(
          topRated: movies,
          nowPlaying: movies,
          popular: movies,
        )
      ],
    );
  });

  group('fetch movies fail', () {
    final fail = ConnectionFailure();

    setUp(() {
      when(getTopRated.execute()).thenAnswer((_) async => Left(fail));
      when(getPopular.execute()).thenAnswer((_) async => Left(fail));
      when(getAiring.execute()).thenAnswer((_) async => Left(fail));
    });

    blocTest<MovieListCubit, MovieListState>(
      'in case of error fetch movies should emit error',
      build: () => cubit,
      act: (cubit) async => cubit.fetchMovies(),
      expect: () => [
        MovieListState.loading(),
        MovieListState.error(fail.message),
      ],
    );
  });
}
