import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:domain/domain.dart';

import '../../dummy_object.dart';
import '../../helper.mocks.dart';

void main() {
  final repository = MockTVShowRepository();
  final usecase = SaveTVShowWatchlist(repository);

  test('Saving tv show to watch list should responds with a String', () async {
    when(repository.saveWatchlist(testTvShowDetail))
        .thenAnswer((_) async => const Right("Save watchlist success"));

    final Either<Failure, String> res = await usecase.call(testTvShowDetail);
    assert(res == const Right<Failure, String>("Save watchlist success"));
  });
}
