import 'package:ditonton/presentation/pages/airing_tv_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/movie_detail_page.dart';
import 'package:ditonton/presentation/pages/home_movie_page.dart';
import 'package:ditonton/presentation/pages/popular_movies_page.dart';
import 'package:ditonton/presentation/pages/search_page.dart';
import 'package:ditonton/presentation/pages/top_rated_movies_page.dart';
import 'package:ditonton/presentation/pages/tv_list_page.dart';
import 'package:ditonton/presentation/pages/watchlist_movies_page.dart';

final routes = (RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
          builder: (_) => HomeMoviePage(), settings: settings);

    case PopularMoviesPage.ROUTE_NAME:
      return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
    case TopRatedMoviesPage.ROUTE_NAME:
      return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
    case MovieDetailPage.ROUTE_NAME:
      final id = settings.arguments as int;
      return MaterialPageRoute(
        builder: (_) => MovieDetailPage(id: id),
        settings: settings,
      );
    case SearchPage.ROUTE_NAME:
      return CupertinoPageRoute(builder: (_) => SearchPage());
    case WatchlistMoviesPage.ROUTE_NAME:
      return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
    case AboutPage.ROUTE_NAME:
      return MaterialPageRoute(builder: (_) => AboutPage());

    //TV
    case TvListPage.ROUTE_NAME:
      return MaterialPageRoute(
          builder: (_) => TvListPage(), settings: settings);
    case AiringTvPage.route:
      return MaterialPageRoute(builder: (_) => AiringTvPage());
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
