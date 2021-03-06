import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';

import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/cubit/movie_detail_cubit.dart';

import '../dummy_object.dart';
import 'movie_detail_cubit_test.mocks.dart';

@GenerateMocks([GetMovieDetail])
void main() {
  late MovieDetailCubit cubit;
  late GetMovieDetail usecase;

  setUp(() {
    usecase = MockGetMovieDetail();
    cubit = MovieDetailCubit(usecase);
  });

  test('initial state is MovieDetailState.initial', () {
    expect(cubit.state, const MovieDetailState.initial());
  });
  blocTest<MovieDetailCubit, MovieDetailState>(
    'fetching movie detail should emit loading and data when successful',
    setUp: () {
      when(usecase.execute(1)).thenAnswer((_) async => const Right(testMovieDetail));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchMovieDetail(1),
    expect: () => [
      const MovieDetailState.loading(),
      const MovieDetailState.data(testMovieDetail),
    ],
  );
  blocTest<MovieDetailCubit, MovieDetailState>(
    'fetching movie detail should emit loading and error message when failed',
    setUp: () {
      when(usecase.execute(1))
          .thenAnswer((_) async => const Left(ConnectionFailure()));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchMovieDetail(1),
    expect: () => [
      const MovieDetailState.loading(),
      MovieDetailState.error(const ConnectionFailure().message),
    ],
  );
}
