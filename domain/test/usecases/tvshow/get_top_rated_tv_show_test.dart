import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:domain/domain.dart';

import '../../helper.mocks.dart';

void main() {
  late final TVShowRepository tvRepository;
  late final GetTopRatedTVShows usecase;
  final List<TVShow> dummyTv = [];
  setUp(() {
    tvRepository = MockTVShowRepository();
    usecase = GetTopRatedTVShows(tvRepository);
  });
  group('Get top rated tv shows', () {
    test('execute', () async {
      when(tvRepository.getTopRatedTvShows())
          .thenAnswer((_) async => Right(dummyTv));
      final tvSeries = await usecase.call();
      assert(tvSeries is Right<Failure, List<TVShow>>);
    });
  });
}
