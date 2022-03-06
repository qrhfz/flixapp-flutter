import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/cubit/tv_show_detail_cubit.dart';
import 'package:dartz/dartz.dart';
import '../dummy_object.dart';
import 'tv_show_detail_cubit_test.mocks.dart';

@GenerateMocks([GetTVShowDetail])
void main() {
  late TvShowDetailCubit cubit;
  late GetTVShowDetail usecase;

  setUp(() {
    usecase = MockGetTVShowDetail();
    cubit = TvShowDetailCubit(usecase);
  });

  test('initial state should be TvShowDetailState.initial()', () {
    expect(cubit.state, const TvShowDetailState.initial());
  });

  blocTest<TvShowDetailCubit, TvShowDetailState>(
    'successful fetchDetail should emit loading and then data state',
    setUp: () {
      when(usecase(1)).thenAnswer((_) async => const Right(testTvShowDetail));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchDetail(1),
    expect: () => const [
      TvShowDetailState.loading(),
      TvShowDetailState.data(testTvShowDetail)
    ],
  );

  blocTest<TvShowDetailCubit, TvShowDetailState>(
    'failing to fetchDetail should emit loading and then data state',
    setUp: () {
      when(usecase(1)).thenAnswer((_) async => const Left(ConnectionFailure()));
    },
    build: () => cubit,
    act: (cubit) => cubit.fetchDetail(1),
    expect: () => [
      const TvShowDetailState.loading(),
      TvShowDetailState.error(const ConnectionFailure().message)
    ],
  );
}
