import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/tvshow/get_airing_tv_shows.dart';
import 'package:ditonton/domain/usecases/tvshow/get_popular_tv_shows.dart';
import 'package:ditonton/domain/usecases/tvshow/get_top_rated_tv_shows.dart';
import 'package:ditonton/presentation/provider/tv_list_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_list_notifier_test.mocks.dart';

@GenerateMocks([GetAiringTvShows, GetPopularTvShows, GetTopRatedTvShows])
void main() {
  final GetAiringTvShows mockGetAiringTvShows = MockGetAiringTvShows();
  final GetPopularTvShows mockGetPopularTvShows = MockGetPopularTvShows();
  final GetTopRatedTvShows mockGetTopRatedTvShows = MockGetTopRatedTvShows();
  late TvListNotifier provider;
  setUp(() {
    provider = TvListNotifier(
        mockGetAiringTvShows, mockGetPopularTvShows, mockGetTopRatedTvShows);
  });

  group('now airing', () {
    test('initialState should be Empty', () {
      expect(provider.airingState, RequestState.Empty);
    });
    test('should get data from the usecase', () async {
      when(mockGetAiringTvShows()).thenAnswer((_) async => Right([]));

      provider.fetchAiring();

      verify(mockGetAiringTvShows());
    });

    test('should change state to Loading when usecase is called', () {
      when(mockGetAiringTvShows()).thenAnswer((_) async => Right([]));

      provider.fetchAiring();

      expect(provider.airingState, RequestState.Loading);
    });

    test('should change airingList when data is gotten successfully', () async {
      when(mockGetAiringTvShows()).thenAnswer((_) async => Right([testTvShow]));

      await provider.fetchAiring();

      expect(provider.airingList, [testTvShow]);
    });

    test('should change state to Error when failing to fetch data', () async {
      when(mockGetAiringTvShows())
          .thenAnswer((_) async => Left(ConnectionFailure()));

      await provider.fetchAiring();

      expect(provider.airingState, RequestState.Error);
    });
  });

  group('popular tv', () {
    test('initialState should be Empty', () {
      expect(provider.popularState, RequestState.Empty);
    });
    test('should get data from the usecase', () async {
      when(mockGetPopularTvShows()).thenAnswer((_) async => Right([]));

      provider.fetchPopular();

      verify(mockGetPopularTvShows());
    });

    test('should change state to Loading when usecase is called', () {
      when(mockGetPopularTvShows()).thenAnswer((_) async => Right([]));

      provider.fetchPopular();

      expect(provider.popularState, RequestState.Loading);
    });

    test('should change tv shows when data is gotten successfully', () async {
      when(mockGetPopularTvShows())
          .thenAnswer((_) async => Right([testTvShow]));

      await provider.fetchPopular();

      expect(provider.popularList, [testTvShow]);
    });

    test('should return error when data is unsuccessful', () async {
      when(mockGetPopularTvShows())
          .thenAnswer((_) async => Left(ConnectionFailure()));

      await provider.fetchPopular();

      expect(provider.popularState, RequestState.Error);
    });
  });

  group('top tv', () {
    test('initialState should be Empty', () {
      expect(provider.topRatedState, RequestState.Empty);
    });
    test('should get data from the usecase', () async {
      when(mockGetTopRatedTvShows()).thenAnswer((_) async => Right([]));

      provider.fetchTopRated();

      verify(mockGetTopRatedTvShows());
    });

    test('should change state to Loading when usecase is called', () {
      when(mockGetTopRatedTvShows()).thenAnswer((_) async => Right([]));

      provider.fetchTopRated();

      expect(provider.topRatedState, RequestState.Loading);
    });

    test('should change tv shows when data is gotten successfully', () async {
      when(mockGetTopRatedTvShows())
          .thenAnswer((_) async => Right([testTvShow]));

      await provider.fetchTopRated();

      expect(provider.topRatedList, [testTvShow]);
    });

    test('should return error when data is unsuccessful', () async {
      when(mockGetTopRatedTvShows())
          .thenAnswer((_) async => Left(ConnectionFailure()));

      await provider.fetchTopRated();

      expect(provider.topRatedState, RequestState.Error);
    });
  });
}
