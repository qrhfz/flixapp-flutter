import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:domain/domain.dart';
import '../../helper.mocks.dart';

void main() {
  late final TVShowRepository tvRepository;
  late final GetPopularTVShows usecase;

  setUp(() {
    tvRepository = MockTVShowRepository();
    usecase = GetPopularTVShows(tvRepository);
  });

  group('Get popular tv shows', () {
    test('execute', () async {
      when(tvRepository.getPopularTVShows())
          .thenAnswer((_) async => const Right([]));
      final popularTvSeries = await usecase();
      assert(popularTvSeries is Right);
    });
  });
}
