import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/datasources/movie_local_data_source.dart';
import 'package:ditonton/data/datasources/movie_remote_data_source.dart';
import 'package:ditonton/data/datasources/tv_remote_data_source.dart';
import 'package:ditonton/data/repositories/movie_repository_impl.dart';
import 'package:ditonton/data/repositories/tv_show_repository_impl.dart';
import 'package:ditonton/domain/movie/repository/movie_repository.dart';
import 'package:ditonton/domain/movie/usecase/get_movie_detail.dart';
import 'package:ditonton/domain/movie/usecase/get_movie_recommendations.dart';
import 'package:ditonton/domain/movie/usecase/get_now_playing_movies.dart';
import 'package:ditonton/domain/movie/usecase/get_popular_movies.dart';
import 'package:ditonton/domain/movie/usecase/get_top_rated_movies.dart';
import 'package:ditonton/domain/movie/usecase/get_watchlist_movies.dart';
import 'package:ditonton/domain/movie/usecase/get_watchlist_status.dart';
import 'package:ditonton/domain/movie/usecase/remove_watchlist.dart';
import 'package:ditonton/domain/movie/usecase/save_watchlist.dart';
import 'package:ditonton/domain/movie/usecase/search_movies.dart';
import 'package:ditonton/domain/tv/usecases/get_airing_tv_shows.dart';
import 'package:ditonton/domain/tv/usecases/get_tv_recommendation.dart';
import 'package:ditonton/domain/tv/usecases/get_tv_show_detail.dart';
import 'package:ditonton/domain/tv/usecases/get_tv_show_watchlist.dart';
import 'package:ditonton/domain/tv/usecases/get_tv_show_watchlist_status.dart';
import 'package:ditonton/domain/tv/usecases/remove_tv_show_watchlist.dart';
import 'package:ditonton/domain/tv/usecases/save_tv_show_watchlist.dart';
import 'package:ditonton/presentation/cubit/movie_detail_watchlist_cubit.dart';
import 'package:ditonton/presentation/cubit/movie_now_playing_cubit.dart';
import 'package:ditonton/presentation/cubit/movie_popular_cubit.dart';
import 'package:ditonton/presentation/cubit/search_cubit.dart';
import 'package:ditonton/presentation/cubit/movie_top_rated_cubit.dart';
import 'package:ditonton/presentation/provider/watchlist_movie_notifier.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

import 'data/datasources/tv_local_data_source.dart';
import 'domain/tv/repository/tv_show_repository.dart';
import 'domain/tv/usecases/get_popular_tv_shows.dart';
import 'domain/tv/usecases/get_top_rated_tv_shows.dart';
import 'domain/tv/usecases/search_tv_shows.dart';
import 'presentation/cubit/movie_detail_cubit.dart';
import 'presentation/cubit/movie_recommendation_cubit.dart';

final locator = GetIt.instance;

void init() {
  // provider

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
