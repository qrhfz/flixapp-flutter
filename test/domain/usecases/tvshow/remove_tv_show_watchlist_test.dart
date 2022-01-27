import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/tvshow/remove_tv_show_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  final repository = MockTvShowRepository();
  final usecase = RemoveTvShowWatchlist(repository);

  test('Removing watchlist should responds with string message', () async {
    final message = "Success removing item from watchlist";
    when(repository.deleteWatchlist(1)).thenAnswer((_) async => Right(message));
    final res = await usecase.execute(1);
    assert(res == Right<Failure, String>(message));
  });
}
