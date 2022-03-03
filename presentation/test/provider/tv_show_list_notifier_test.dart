import 'package:dartz/dartz.dart';
import 'package:presentation/helper/state_enum.dart';
import 'package:domain/domain.dart';
import 'package:presentation/provider/tv_show_list_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../dummy_object.dart';
import 'tv_show_list_notifier_test.mocks.dart';

@GenerateMocks([GetAiringTVShows, GetPopularTVShows, GetTopRatedTVShows])
void main() {
  final GetAiringTVShows mockGetAiringTvShows = MockGetAiringTVShows();
  final GetPopularTVShows mockGetPopularTvShows = MockGetPopularTVShows();
  final GetTopRatedTVShows mockGetTopRatedTvShows = MockGetTopRatedTVShows();
  late TVShowListNotifier provider;
  setUp(() {
    provider = TVShowListNotifier(
      getAiring: mockGetAiringTvShows,
      getPopular: mockGetPopularTvShows,
      getTopRated: mockGetTopRatedTvShows,
    );
  });

  group('now airing', () {
    test('initialState should be Empty', () {
      expect(provider.airingState, RequestState.empty);
    });
    test('should get data from the usecase', () async {
      when(mockGetAiringTvShows()).thenAnswer((_) async => const Right([]));

      provider.fetchAiring();

      verify(mockGetAiringTvShows());
    });

    test('should change state to Loading when usecase is called', () {
      when(mockGetAiringTvShows()).thenAnswer((_) async => const Right([]));

      provider.fetchAiring();

      expect(provider.airingState, RequestState.loading);
    });

    test('should change airingList when data is gotten successfully', () async {
      when(mockGetAiringTvShows())
          .thenAnswer((_) async => const Right([testTvShow]));

      await provider.fetchAiring();

      expect(provider.airingList, [testTvShow]);
    });

    test('should change state to Error when failing to fetch data', () async {
      when(mockGetAiringTvShows())
          .thenAnswer((_) async => const Left(ConnectionFailure()));

      await provider.fetchAiring();

      expect(provider.airingState, RequestState.error);
    });
  });

  group('popular tv', () {
    test('initialState should be Empty', () {
      expect(provider.popularState, RequestState.empty);
    });
    test('should get data from the usecase', () async {
      when(mockGetPopularTvShows()).thenAnswer((_) async => const Right([]));

      provider.fetchPopular();

      verify(mockGetPopularTvShows());
    });

    test('should change state to Loading when usecase is called', () {
      when(mockGetPopularTvShows()).thenAnswer((_) async => const Right([]));

      provider.fetchPopular();

      expect(provider.popularState, RequestState.loading);
    });

    test('should change tv shows when data is gotten successfully', () async {
      when(mockGetPopularTvShows())
          .thenAnswer((_) async => const Right([testTvShow]));

      await provider.fetchPopular();

      expect(provider.popularList, [testTvShow]);
    });

    test('should return error when data is unsuccessful', () async {
      when(mockGetPopularTvShows())
          .thenAnswer((_) async => const Left(ConnectionFailure()));

      await provider.fetchPopular();

      expect(provider.popularState, RequestState.error);
    });
  });

  group('top tv', () {
    test('initialState should be Empty', () {
      expect(provider.topRatedState, RequestState.empty);
    });
    test('should get data from the usecase', () async {
      when(mockGetTopRatedTvShows()).thenAnswer((_) async => const Right([]));

      provider.fetchTopRated();

      verify(mockGetTopRatedTvShows());
    });

    test('should change state to Loading when usecase is called', () {
      when(mockGetTopRatedTvShows()).thenAnswer((_) async => const Right([]));

      provider.fetchTopRated();

      expect(provider.topRatedState, RequestState.loading);
    });

    test('should change tv shows when data is gotten successfully', () async {
      when(mockGetTopRatedTvShows())
          .thenAnswer((_) async => const Right([testTvShow]));

      await provider.fetchTopRated();

      expect(provider.topRatedList, [testTvShow]);
    });

    test('should return error when data is unsuccessful', () async {
      when(mockGetTopRatedTvShows())
          .thenAnswer((_) async => const Left(ConnectionFailure()));

      await provider.fetchTopRated();

      expect(provider.topRatedState, RequestState.error);
    });
  });
}
