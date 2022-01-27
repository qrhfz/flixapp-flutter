import 'package:dartz/dartz.dart';
import 'package:ditonton/common/usecase.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';
import 'package:ditonton/domain/usecases/tvshow/get_tv_show_watchlist_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main(List<String> args) {
  final TvShowRepository repository = MockTvShowRepository();
  final UseCase usecase = GetTvShowWatchlistStatus(repository);

  test('Given id GetTvShowWatchlistStatus should return a boolean', () async {
    when(repository.isInWatchlist(1)).thenAnswer((_) async => true);
    final res = await usecase.execute(1);
    assert(res is bool);
  });
}
