import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/presentation/cubit/movie_detail_cubit.dart';
import 'package:ditonton/presentation/cubit/movie_recommendation_cubit.dart';
import 'package:ditonton/presentation/provider/tv_show_detail_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_list_notifier.dart';
import 'package:ditonton/presentation/provider/watchlist_movie_notifier.dart';
import 'package:ditonton/presentation/provider/watchlist_tv_show_notifier.dart';
import 'package:ditonton/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ditonton/injection.dart' as di;

import 'presentation/cubit/movie_detail_watchlist_cubit.dart';
import 'presentation/cubit/movie_now_playing_cubit.dart';
import 'presentation/cubit/movie_popular_cubit.dart';
import 'presentation/cubit/search_cubit.dart';
import 'presentation/cubit/movie_top_rated_cubit.dart';
import 'presentation/provider/tv_show_search_notifier.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TVShowSearchNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistMovieNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => TVShowListNotifier(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => TVShowDetailNotifier(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => WatchlistTVShowNotifier(),
          lazy: true,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => di.locator<MovieNowPlayingCubit>(),
            lazy: true,
          ),
          BlocProvider(
            create: (_) => di.locator<MoviePopularCubit>(),
            lazy: true,
          ),
          BlocProvider(
            create: (_) => di.locator<MovieTopRatedCubit>(),
            lazy: true,
          ),
          BlocProvider(
            create: (_) => di.locator<MovieDetailCubit>(),
            lazy: true,
          ),
          BlocProvider(
            create: (_) => di.locator<MovieRecommendationCubit>(),
            lazy: true,
          ),
          BlocProvider(
            create: (_) => di.locator<MovieDetailWatchlistCubit>(),
            lazy: true,
          ),
          BlocProvider(
            create: (_) => di.locator<SearchCubit>(),
            lazy: true,
          ),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.dark().copyWith(
              primaryColor: kRichBlack,
              scaffoldBackgroundColor: kRichBlack,
              textTheme: kTextTheme,
              colorScheme: kColorScheme.copyWith(secondary: kMikadoYellow),
            ),
            navigatorObservers: [routeObserver],
            onGenerateRoute: routes),
      ),
    );
  }
}
