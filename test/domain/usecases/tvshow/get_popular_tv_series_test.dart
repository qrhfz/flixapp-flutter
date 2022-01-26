import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';
import 'package:ditonton/domain/usecases/tvshow/get_popular_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late final TvRepository tvRepository;
  late final GetPopularTvSeries usecase;

  setUp(() {
    tvRepository = MockTvRepository();
    usecase = GetPopularTvSeries(tvRepository);
  });

  group('Get popular tv series', () {
    test('execute', () async {
      when(tvRepository.getPopularTvSeries())
          .thenAnswer((_) async => Right([]));
      final popularTvSeries = await usecase.execute();
      assert(popularTvSeries is Right);
    });
  });
}
