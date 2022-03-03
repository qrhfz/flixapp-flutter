import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:domain/domain.dart';

import '../../dummy_object.dart';
import '../../helper.mocks.dart';

void main() {
  group('Get Tv Show Detail', () {
    late final TVShowRepository repository;
    late final GetTVShowDetail usecase;

    setUp(() {
      repository = MockTVShowRepository();
      usecase = GetTVShowDetail(repository);
    });
    test('execute', () async {
      when(repository.getTvShowDetail(0)).thenAnswer(
        (realInvocation) async => const Right(testTvShowDetail),
      );

      final res = await usecase.call(0);
      assert(res == const Right<Failure, TVShowDetail>(testTvShowDetail));
    });
  });
}
