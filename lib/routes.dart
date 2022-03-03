import 'package:presentation/presentation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final routes = (RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
          builder: (_) => HomeMoviePage(), settings: settings);

    case PopularMoviesPage.routeName:
      return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
    case TopRatedMoviesPage.routeName:
      return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
    case MovieDetailPage.routeName:
      final id = settings.arguments as int;
      return MaterialPageRoute(
        builder: (_) => MovieDetailPage(id: id),
        settings: settings,
      );
    case SearchPage.routeName:
      return CupertinoPageRoute(builder: (_) => SearchPage());
    case WatchlistMoviesPage.routeName:
      return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
    case AboutPage.routeName:
      return MaterialPageRoute(builder: (_) => AboutPage());

    //TV
    case TvListPage.routeName:
      return MaterialPageRoute(
          builder: (_) => TvListPage(), settings: settings);
    case AiringTVShowPage.route:
      return MaterialPageRoute(builder: (_) => AiringTVShowPage());
    case PopularTvPage.route:
      return MaterialPageRoute(builder: (_) => PopularTvPage());
    case TvDetailPage.route:
      return MaterialPageRoute(builder: (_) {
        final id = settings.arguments as int;
        return TvDetailPage(id);
      });
    default:
      return MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('Page not found :('),
            ),
          );
        },
      );
  }
};
