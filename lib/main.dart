import 'package:presentation/presentation.dart';

import 'package:ditonton/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ditonton/injection.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<MovieNowPlayingCubit>()),
        BlocProvider(create: (_) => di.locator<MoviePopularCubit>()),
        BlocProvider(create: (_) => di.locator<MovieTopRatedCubit>()),
        BlocProvider(create: (_) => di.locator<MovieDetailCubit>()),
        BlocProvider(create: (_) => di.locator<MovieRecommendationCubit>()),
        BlocProvider(create: (_) => di.locator<MovieDetailWatchlistCubit>()),
        BlocProvider(create: (_) => di.locator<SearchCubit>()),
        BlocProvider(create: (_) => di.locator<TvShowAiringCubit>()),
        BlocProvider(create: (_) => di.locator<TvShowTopRatedCubit>()),
        BlocProvider(create: (_) => di.locator<TvShowPopularCubit>()),
        BlocProvider(create: (_) => di.locator<TvShowDetailCubit>()),
        BlocProvider(create: (_) => di.locator<TvShowRecommendationCubit>()),
        BlocProvider(create: (_) => di.locator<TvShowDetailWatchlistCubit>()),
        BlocProvider(create: (_) => di.locator<WatchlistCubit>()),
        BlocProvider(create: (_) => di.locator<TvWatchlistCubit>()),
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
    );
  }
}
