import 'package:dartz/dartz.dart';
import 'package:presentation/helper/state_enum.dart';
import 'package:domain/domain.dart';
import 'package:presentation/provider/tv_show_search_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../dummy_object.dart';
import 'tv_show_search_notifier_test.mocks.dart';

@GenerateMocks([SearchTVShows])
void main() {
  final usecase = MockSearchTVShows();
  final provider = TVShowSearchNotifier(usecase);

  test('request state should be initialized as empty', () {
    expect(provider.state, RequestState.empty);
  });

  group('fetching data success', () {
    setUp(() {
      when(usecase("flash")).thenAnswer((_) async => const Right([testTvShow]));
    });

    test('calling usecase should change the state to loading', () async {
      provider.fetchTvSearch("flash");

      expect(provider.state, RequestState.loading);
    });

    test('update state to be Loaded after usecase successfully called',
        () async {
      await provider.fetchTvSearch("flash");

      expect(provider.state, RequestState.loaded);
    });
    test('update watchlistTvShows after usecase successfully called', () async {
      await provider.fetchTvSearch("flash");

      expect(provider.tvSearchResult, [testTvShow]);
    });
  });

  group('fetching data fail', () {
    const fail = ConnectionFailure();
    setUp(() {
      when(usecase("flash")).thenAnswer((_) async => const Left(fail));
    });

    test('update state to be Error after usecase done being called', () async {
      await provider.fetchTvSearch("flash");

      expect(provider.state, RequestState.error);
    });
    test('update message after usecase successfully called', () async {
      await provider.fetchTvSearch("flash");

      expect(provider.message, fail.message);
    });
  });
}