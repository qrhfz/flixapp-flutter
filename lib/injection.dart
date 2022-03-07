import 'dart:io';

import 'package:data/data.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

final locator = GetIt.instance;

void init() {
  // provider

  locator.registerFactory(() => TvWatchlistCubit(locator()));

  locator.registerFactory(() => TvShowDetailCubit(locator()));
  locator.registerFactory(() => TvShowRecommendationCubit(locator()));
  locator.registerFactory(
    () => TvShowDetailWatchlistCubit(
      getStatus: locator(),
      save: locator(),
      remove: locator(),
    ),
  );
  locator.registerFactory(
    () => SearchCubit(
      searchMovies: locator(),
      searchTVShows: locator(),
    ),
  );

  locator.registerFactory(() => WatchlistCubit(locator()));
  locator.registerFactory(() => MovieNowPlayingCubit(locator()));
  locator.registerFactory(() => MovieTopRatedCubit(locator()));
  locator.registerFactory(() => MoviePopularCubit(locator()));
  locator.registerFactory(() => MovieDetailCubit(locator()));
  locator.registerFactory(() => MovieRecommendationCubit(locator()));
  locator.registerFactory(
    () => MovieDetailWatchlistCubit(
      getWatchListStatus: locator(),
      removeWatchlist: locator(),
      saveWatchlist: locator(),
    ),
  );
  locator.registerFactory(() => TvShowAiringCubit(locator()));
  locator.registerFactory(() => TvShowPopularCubit(locator()));
  locator.registerFactory(() => TvShowTopRatedCubit(locator()));

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  locator.registerLazySingleton(() => GetAiringTVShows(locator()));
  locator.registerLazySingleton(() => GetPopularTVShows(locator()));
  locator.registerLazySingleton(() => GetTopRatedTVShows(locator()));
  locator.registerLazySingleton(() => GetTVShowDetail(locator()));
  locator.registerLazySingleton(() => GetTvRecommendations(locator()));
  locator.registerLazySingleton(
      () => SearchTVShows(locator(), analytics: FirebaseAnalytics.instance));
  locator.registerLazySingleton(() => SaveTVShowWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveTVShowWatchlist(locator()));
  locator.registerLazySingleton(() => GetTVShowWatchlistStatus(locator()));
  locator.registerLazySingleton(() => GetTVShowWatchlist(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<TVShowRepository>(
    () => TvShowRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(
      getContext: _getContext,
    ),
  );
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));

  locator.registerLazySingleton<TVShowRemoteDataSource>(
      () => TVShowRemoteDataSourceImpl(getContext: _getContext));

  locator.registerLazySingleton<TVShowLocalDataSource>(
      () => TVShowLocalDataSourceImpl(locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
}

Future<SecurityContext> _getContext() async {
  final sslCert = await rootBundle.load('certificates/themoviedb-org.pem');
  SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
  securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());
  return securityContext;
}
