import 'package:data/data.dart';

import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

final locator = GetIt.instance;

void init() {
  // provider

  locator.registerFactory(() => WatchlistTVShowNotifier(locator()));

  locator.registerFactory(
    () => TVShowDetailNotifier(
        getDetail: locator(),
        getRecommendations: locator(),
        getWatchlistStatus: locator(),
        removeWatchlist: locator(),
        saveWatchlist: locator()),
  );
  locator.registerFactory(
    () => SearchCubit(
      searchMovies: locator(),
      searchTVShows: locator(),
    ),
  );

  locator.registerFactory(
    () => WatchlistMovieNotifier(
      getWatchlistMovies: locator(),
    ),
  );
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
  locator.registerLazySingleton(() => SearchTVShows(locator()));
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
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));

  locator.registerLazySingleton<TVShowRemoteDataSource>(
      () => TVShowRemoteDataSourceImpl(locator()));

  locator.registerLazySingleton<TVShowLocalDataSource>(
      () => TVShowLocalDataSourceImpl(locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
}
