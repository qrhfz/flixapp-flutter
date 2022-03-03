import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:domain/domain.dart';

import '../../helper.mocks.dart';

void main() {
  final TVShowRepository repository = MockTVShowRepository();
  final GetTVShowWatchlistStatus usecase = GetTVShowWatchlistStatus(repository);

  test('Given id GetTvShowWatchlistStatus should return a boolean', () async {
    when(repository.getWatchlistStatus(1)).thenAnswer((_) async => true);
    final res = await usecase.call(1);
    assert(res == true);
  });
}
