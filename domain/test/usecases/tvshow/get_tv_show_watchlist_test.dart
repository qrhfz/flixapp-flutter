import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:domain/domain.dart';
import '../../helper.mocks.dart';

void main() {
  final repository = MockTVShowRepository();
  final GetTVShowWatchlist usecase = GetTVShowWatchlist(repository);

  test('Get watchlist tv show should return list of tv shows', () async {
    final List<TVShow> dummyData = [];
    when(repository.getTvShowWatchlist())
        .thenAnswer((_) async => Right(dummyData));
    final res = await usecase.call();
    assert(res == Right<Failure, List<TVShow>>(dummyData));
  });
}
