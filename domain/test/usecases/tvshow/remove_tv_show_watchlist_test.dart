import 'package:dartz/dartz.dart';
import 'package:domain/tv/usecases/remove_tv_show_watchlist.dart';
import 'package:domain/utils/failure.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper.mocks.dart';

void main() {
  final repository = MockTVShowRepository();
  final usecase = RemoveTVShowWatchlist(repository);

  test('Removing watchlist should responds with string message', () async {
    const message = "Success removing item from watchlist";
    when(repository.removeWatchlist(1))
        .thenAnswer((_) async => const Right(message));
    final res = await usecase.call(1);
    assert(res == const Right<Failure, String>(message));
  });
}
