import 'package:ditonton/domain/repositories/tv_show_repository.dart';
import 'package:ditonton/domain/usecases/tvshow/get_tv_show_watchlist_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  final TvShowRepository repository = MockTvShowRepository();
  final GetTvShowWatchlistStatus usecase = GetTvShowWatchlistStatus(repository);

  test('Given id GetTvShowWatchlistStatus should return a boolean', () async {
    when(repository.getWatchlistStatus(1)).thenAnswer((_) async => true);
    final res = await usecase.call(1);
    assert(res == true);
  });
}
