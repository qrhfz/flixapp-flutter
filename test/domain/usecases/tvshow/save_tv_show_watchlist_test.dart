import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/tvshow/save_tv_show_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  final repository = MockTvShowRepository();
  final usecase = SaveTvShowWatchlist(repository);

  test('Saving tv show to watch list should responds with a String', () async {
    when(repository.saveWatchlist(testTvShowDetail))
        .thenAnswer((_) async => Right("Save watchlist success"));

    final Either<Failure, String> res = await usecase.call(testTvShowDetail);
    assert(res == Right<Failure, String>("Save watchlist success"));
  });
}
