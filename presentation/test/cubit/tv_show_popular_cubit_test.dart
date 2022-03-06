import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/cubit/tv_show_popular_cubit.dart';

import 'tv_show_popular_cubit_test.mocks.dart';

@GenerateMocks([GetPopularTVShows])
void main() {
  late TvShowPopularCubit cubit;
  late GetPopularTVShows getPopularTVShows;

  setUp(() {
    getPopularTVShows = MockGetPopularTVShows();
    cubit = TvShowPopularCubit(getPopularTVShows);
  });

  test("cubit's initial state should be TvShowPopularState.initial()", () {
    expect(cubit.state, const TvShowPopularState.initial());
  });

  blocTest<TvShowPopularCubit, TvShowPopularState>(
    'successful fetchPopular should emit loading and then data state',
    setUp: () {
      when(getPopularTVShows())
          .thenAnswer((_) async => const Right(<TVShow>[]));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchPopular(),
    expect: () => const [
      TvShowPopularState.loading(),
      TvShowPopularState.data(<TVShow>[])
    ],
  );

  blocTest<TvShowPopularCubit, TvShowPopularState>(
    'failed fetchPopular should emit loading and then data state',
    setUp: () {
      when(getPopularTVShows())
          .thenAnswer((_) async => const Left(ConnectionFailure()));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchPopular(),
    expect: () => [
      const TvShowPopularState.loading(),
      TvShowPopularState.error(const ConnectionFailure().message)
    ],
  );
}
