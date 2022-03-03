import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/utils/failure.dart';
import 'package:ditonton/domain/tv/entities/tv_show.dart';
import 'package:ditonton/domain/tv/repository/tv_show_repository.dart';
import 'package:ditonton/domain/tv/usecases/get_top_rated_tv_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

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
