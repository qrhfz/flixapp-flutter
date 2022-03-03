import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:domain/domain.dart';

import '../provider/watchlist_movie_notifier.dart';
import '../provider/watchlist_tv_show_notifier.dart';
import '../helper/state_enum.dart';
import 'package:presentation/helper/utilities.dart';
import '../widgets/movie_card_list.dart';
import '../widgets/tv_card.dart';

class WatchlistMoviesPage extends StatefulWidget {
  static const routeName = '/watchlist-movie';

  const WatchlistMoviesPage({Key? key}) : super(key: key);

  @override
  _WatchlistMoviesPageState createState() => _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistMoviesPage>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<WatchlistMovieNotifier>(context, listen: false)
          .fetchWatchlistMovies();
      Provider.of<WatchlistTVShowNotifier>(context, listen: false)
          .fetchWatchlistTvShows();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    Provider.of<WatchlistMovieNotifier>(context, listen: false)
        .fetchWatchlistMovies();
    Provider.of<WatchlistTVShowNotifier>(context, listen: false)
        .fetchWatchlistTvShows();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Watchlist'),
        ),
        body: Column(
          children: [
            const TabBar(tabs: [Tab(text: 'MOVIES'), Tab(text: 'TV SERIES')]),
            Expanded(
              child: TabBarView(children: [
                Consumer<WatchlistMovieNotifier>(
                  builder: (context, data, child) => MovieWatchlist(
                    watchlistState: data.watchlistState,
                    watchlistMovies: data.watchlistMovies,
                    message: data.message,
                  ),
                ),
                Consumer<WatchlistTVShowNotifier>(
                  builder: (context, value, child) => TvWatchlist(
                    message: value.message,
                    tvWatchlist: value.watchlistTvShows,
                    watchlistState: value.watchlistState,
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}

class MovieWatchlist extends StatelessWidget {
  const MovieWatchlist({
    Key? key,
    required this.watchlistState,
    required this.watchlistMovies,
    required this.message,
  }) : super(key: key);

  final RequestState watchlistState;
  final List<Movie> watchlistMovies;
  final String message;

  @override
  Widget build(BuildContext context) {
    if (watchlistState == RequestState.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (watchlistState == RequestState.loaded) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final movie = watchlistMovies[index];
          return MovieCard(movie);
        },
        itemCount: watchlistMovies.length,
      );
    } else {
      return Center(
        key: const Key('error_message'),
        child: Text(message),
      );
    }
  }
}

class TvWatchlist extends StatelessWidget {
  const TvWatchlist({
    Key? key,
    required this.watchlistState,
    required this.tvWatchlist,
    required this.message,
  }) : super(key: key);

  final RequestState watchlistState;
  final List<TVShow> tvWatchlist;
  final String message;

  @override
  Widget build(BuildContext context) {
    if (watchlistState == RequestState.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (watchlistState == RequestState.loaded) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final tv = tvWatchlist[index];
          return TvCard(tv);
        },
        itemCount: tvWatchlist.length,
      );
    } else {
      return Center(
        key: const Key('error_message'),
        child: Text(message),
      );
    }
  }
}
