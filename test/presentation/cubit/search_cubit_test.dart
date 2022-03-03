import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/utils/failure.dart';
import 'package:ditonton/domain/movie/entities/movie.dart';
import 'package:ditonton/domain/tv/entities/tv_show.dart';
import 'package:ditonton/domain/movie/usecase/search_movies.dart';
import 'package:ditonton/domain/tv/usecases/search_tv_shows.dart';
import 'package:ditonton/presentation/cubit/search_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_cubit_test.mocks.dart';

@GenerateMocks([SearchMovies, SearchTVShows])
void main() {
  late SearchCubit cubit;
  late SearchMovies searchMovies;
  late SearchTVShows searchTVShows;

  setUp(() {
    searchMovies = MockSearchMovies();
    searchTVShows = MockSearchTVShows();
    cubit = SearchCubit(
      searchMovies: searchMovies,
      searchTVShows: searchTVShows,
    );
  });

  test('initial state should be MovieSearchState.initial', () {
    expect(cubit.state, SearchState.initial());
  });

  blocTest<SearchCubit, SearchState>(
    "successfully searching movies should emit loading state and then movieResult state",
    setUp: () {
      when(searchMovies.execute("test"))
          .thenAnswer((_) async => Right(<Movie>[]));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchMovieSearch("test"),
    expect: () => [
      SearchState.loading(),
      SearchState.movieResult(<Movie>[]),
    ],
  );
  blocTest<SearchCubit, SearchState>(
    "successfully searching movies should emit loading state and then error state",
    setUp: () {
      when(searchMovies.execute(""))
          .thenAnswer((_) async => Left(ConnectionFailure()));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchMovieSearch(""),
    expect: () => [
      SearchState.loading(),
      SearchState.error(ConnectionFailure().message),
    ],
  );

  blocTest<SearchCubit, SearchState>(
    "successfully searching tv shows should emit loading state and then data state",
    setUp: () {
      when(searchTVShows("test")).thenAnswer((_) async => Right(<TVShow>[]));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchTVShowSearch("test"),
    expect: () => [
      SearchState.loading(),
      SearchState.tvResult(<TVShow>[]),
    ],
  );
  blocTest<SearchCubit, SearchState>(
    "successfully searching tv shows should emit loading state and then error state",
    setUp: () {
      when(searchTVShows(""))
          .thenAnswer((_) async => Left(ConnectionFailure()));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchTVShowSearch(""),
    expect: () => [
      SearchState.loading(),
      SearchState.error(ConnectionFailure().message),
    ],
  );
}
