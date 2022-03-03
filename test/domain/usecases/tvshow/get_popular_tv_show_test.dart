import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/tv/repository/tv_show_repository.dart';
import 'package:ditonton/domain/tv/usecases/get_popular_tv_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late final TVShowRepository tvRepository;
  late final GetPopularTVShows usecase;

  setUp(() {
    tvRepository = MockTVShowRepository();
    usecase = GetPopularTVShows(tvRepository);
  });

  group('Get popular tv shows', () {
    test('execute', () async {
      when(tvRepository.getPopularTVShows()).thenAnswer((_) async => Right([]));
      final popularTvSeries = await usecase();
      assert(popularTvSeries is Right);
    });
  });
}
