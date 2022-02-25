import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/tvshow/get_tv_show_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  final repository = MockTvShowRepository();
  final GetTVShowWatchlist usecase = GetTVShowWatchlist(repository);

  test('Get watchlist tv show should return list of tv shows', () async {
    final List<TVShow> dummyData = [];
    when(repository.getTvShowWatchlist())
        .thenAnswer((_) async => Right(dummyData));
    final res = await usecase.call();
    assert(res == Right<Failure, List<TVShow>>(dummyData));
  });
}
