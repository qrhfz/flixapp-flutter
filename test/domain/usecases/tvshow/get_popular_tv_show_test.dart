import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';
import 'package:ditonton/domain/usecases/tvshow/get_popular_tv_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late final TVShowRepository tvRepository;
  late final GetPopularTVShows usecase;

  setUp(() {
    tvRepository = MockTvShowRepository();
    usecase = GetPopularTVShows(tvRepository);
  });

  group('Get popular tv shows', () {
    test('execute', () async {
      when(tvRepository.getPopularTvShows()).thenAnswer((_) async => Right([]));
      final popularTvSeries = await usecase();
      assert(popularTvSeries is Right);
    });
  });
}
