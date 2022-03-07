import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:presentation/presentation.dart';
import 'package:ditonton/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ditonton/injection.dart' as di;
import 'package:firebase_analytics/firebase_analytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  di.init();
  if (kDebugMode) {
    // Force disable Crashlytics collection while doing every day development.
    // Temporarily toggle this to true if you want to test crash reporting in your app.
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  }
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  analytics.logAppOpen();
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
