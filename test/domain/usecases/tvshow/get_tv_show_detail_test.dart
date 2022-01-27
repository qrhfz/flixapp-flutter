import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';
import 'package:ditonton/domain/usecases/tvshow/get_tv_show_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  group('Get Tv Show Detail', () {
    late final TvShowRepository repository;
    late final GetTvShowDetail usecase;

    setUp(() {
      repository = MockTvShowRepository();
      usecase = GetTvShowDetail(repository);
    });
    test('execute', () async {
      when(repository.getTvShowDetail(0)).thenAnswer(
        (realInvocation) async => Right(testTvShowDetail),
      );

      final res = await usecase.execute(GetTvShowDetailParams(0));
      assert(res == Right<Failure, TvShowDetail>(testTvShowDetail));
    });
  });
}
