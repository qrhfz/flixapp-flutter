import 'package:presentation/presentation.dart';

import 'package:ditonton/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ditonton/injection.dart' as di;

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
          create: (_) => di.locator<TVShowSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistMovieNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TVShowListNotifier>(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TVShowDetailNotifier>(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistTVShowNotifier>(),
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
