import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:domain/domain.dart';
import '../../helper.mocks.dart';

void main() {
  late final GetAiringTVShows usecase;
  late final TVShowRepository repository;

  setUp(() {
    repository = MockTVShowRepository();
    usecase = GetAiringTVShows(repository);
  });
  group('Get airing tv shows', () {
    final List<TVShow> data = [];
    test('execute', () async {
      when(repository.getAiringTVShows()).thenAnswer((_) async => Right(data));
      final res = await usecase.call();
      assert(res is Right<Failure, List<TVShow>>);
    });
  });
}
