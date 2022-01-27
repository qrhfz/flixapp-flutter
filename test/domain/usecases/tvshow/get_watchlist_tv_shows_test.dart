import 'package:dartz/dartz.dart';
import 'package:ditonton/common/usecase.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/tvshow/get_watchlist_tv_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  final repository = MockTvShowRepository();
  final UseCase usecase = GetWatchlistTvShows(repository);

  test('Get watchlist tv show should return list of tv shows', () async {
    final List<TvShow> dummyData = [];
    when(repository.getTvShowWatchlist())
        .thenAnswer((_) async => Right(dummyData));
    final res = await usecase.execute(null);
    assert(res == Right(dummyData));
  });
}
