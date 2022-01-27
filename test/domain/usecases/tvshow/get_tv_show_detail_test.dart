import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';
import 'package:ditonton/domain/usecases/tvshow/get_tv_show_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  group('Get Tv Show Detail', () {
    late final TvShowRepository repository;
    late final GetTvShowDetail usecase;

    setUp(() {
      repository = MockTvShowRepository();
      usecase = GetTvShowDetail(0, repository);
    });
    test('execute', () async {
      final dummy = TvShowDetail(
        id: 0,
        backdropPath: 'backdropPath',
        firstAirDate: DateTime(2022, 1, 1),
        overview: 'overview',
        popularity: 1.0,
        posterPath: 'posterPath',
        title: 'title',
        voteAverage: 5.5,
        voteCount: 5,
      );

      when(repository.getTvShowDetail(0)).thenAnswer(
        (realInvocation) async => Right(dummy),
      );
      final res = await usecase.execute();
      assert(res is Right<Failure, TvShowDetail>);
    });
  });
}
