import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';
import 'package:ditonton/domain/usecases/tvshow/get_top_rated_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late final TvRepository tvRepository;
  late final GetTopRatedTvSeries usecase;
  final List<Tv> dummyTv = [];
  setUp(() {
    tvRepository = MockTvRepository();
    usecase = GetTopRatedTvSeries(tvRepository);
  });
  group('Get top rated tv series', () {
    test('execute', () async {
      when(tvRepository.getTopRatedTvSeries())
          .thenAnswer((_) async => Right(dummyTv));
      final tvSeries = await usecase.execute();
      assert(tvSeries is Right<Failure, List<Tv>>);
    });
  });
}
