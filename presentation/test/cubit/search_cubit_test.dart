import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/cubit/search_cubit.dart';

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
    expect(cubit.state, const SearchState.initial());
  });

  blocTest<SearchCubit, SearchState>(
    "successfully searching movies should emit loading state and then movieResult state",
    setUp: () {
      when(searchMovies.execute("test"))
          .thenAnswer((_) async => const Right(<Movie>[]));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchMovieSearch("test"),
    expect: () => [
      const SearchState.loading(),
      const SearchState.movieResult(<Movie>[]),
    ],
  );
  blocTest<SearchCubit, SearchState>(
    "successfully searching movies should emit loading state and then error state",
    setUp: () {
      when(searchMovies.execute(""))
          .thenAnswer((_) async => const Left(ConnectionFailure()));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchMovieSearch(""),
    expect: () => [
      const SearchState.loading(),
      SearchState.error(const ConnectionFailure().message),
    ],
  );

  blocTest<SearchCubit, SearchState>(
    "successfully searching tv shows should emit loading state and then data state",
    setUp: () {
      when(searchTVShows("test")).thenAnswer((_) async => const Right(<TVShow>[]));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchTVShowSearch("test"),
    expect: () => [
      const SearchState.loading(),
      const SearchState.tvResult(<TVShow>[]),
    ],
  );
  blocTest<SearchCubit, SearchState>(
    "successfully searching tv shows should emit loading state and then error state",
    setUp: () {
      when(searchTVShows(""))
          .thenAnswer((_) async => const Left(ConnectionFailure()));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchTVShowSearch(""),
    expect: () => [
      const SearchState.loading(),
      SearchState.error(const ConnectionFailure().message),
    ],
  );
}
