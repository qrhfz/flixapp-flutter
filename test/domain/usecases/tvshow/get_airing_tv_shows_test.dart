import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';
import 'package:ditonton/domain/usecases/tvshow/get_airing_tv_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late final GetAiringTvShows usecase;
  late final TvShowRepository repository;

  setUp(() {
    repository = MockTvShowRepository();
    usecase = GetAiringTvShows(repository);
  });
  group('Get airing tv shows', () {
    final List<TvShow> data = [];
    test('execute', () async {
      when(repository.getAiringTvShows()).thenAnswer((_) async => Right(data));
      final res = await usecase.execute(null);
      assert(res is Right<Failure, List<TvShow>>);
    });
  });
}
