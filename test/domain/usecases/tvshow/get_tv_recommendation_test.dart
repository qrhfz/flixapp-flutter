import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/tvshow/get_tv_recommendation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  final repository = MockTVShowRepository();
  final usecase = GetTvRecommendations(repository);
  final List<TVShow> tTvList = [];
  test('get tv recommendation usecase return list of tv show', () async {
    when(repository.getTvRecommendations(1))
        .thenAnswer((_) async => Right(tTvList));

    final result = await usecase(1);

    expect(result, Right(tTvList));
  });
}
