import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/movie/get_movie_detail.dart';
import 'package:ditonton/presentation/cubit/movie_detail_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
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
    expect(cubit.state, MovieDetailState.initial());
  });
  blocTest<MovieDetailCubit, MovieDetailState>(
    'fetching movie detail should emit loading and data when successful',
    setUp: () {
      when(usecase.execute(1)).thenAnswer((_) async => Right(testMovieDetail));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchMovieDetail(1),
    expect: () => [
      MovieDetailState.loading(),
      MovieDetailState.data(testMovieDetail),
    ],
  );
  blocTest<MovieDetailCubit, MovieDetailState>(
    'fetching movie detail should emit loading and error message when failed',
    setUp: () {
      when(usecase.execute(1))
          .thenAnswer((_) async => Left(ConnectionFailure()));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchMovieDetail(1),
    expect: () => [
      MovieDetailState.loading(),
      MovieDetailState.error(ConnectionFailure().message),
    ],
  );
}
