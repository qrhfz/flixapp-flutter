import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/cubit/watchlist_cubit.dart';

import '../cubit/tv_watchlist_cubit.dart';
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
      BlocProvider.of<WatchlistCubit>(context, listen: false).fetchWatchlist();
      BlocProvider.of<TvWatchlistCubit>(context, listen: false)
          .fetchWatchlist();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    BlocProvider.of<WatchlistCubit>(context, listen: false).fetchWatchlist();
    BlocProvider.of<TvWatchlistCubit>(context, listen: false).fetchWatchlist();
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
          children: const [
            TabBar(tabs: [Tab(text: 'MOVIES'), Tab(text: 'TV SERIES')]),
            Expanded(
              child: TabBarView(
                children: [
                  MovieWatchlist(),
                  TvWatchlist(),
                ],
              ),
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
  const MovieWatchlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistCubit, WatchlistState>(
      builder: (contextm, state) {
        return state.when(
          initial: () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          data: (movies) => ListView.builder(
            itemBuilder: (context, index) {
              final movie = movies[index];
              return MovieCard(movie);
            },
            itemCount: movies.length,
          ),
          error: (message) => Center(
            key: const Key('error_message'),
            child: Text(message),
          ),
        );
      },
    );
  }
}

class TvWatchlist extends StatelessWidget {
  const TvWatchlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvWatchlistCubit, TvWatchlistState>(
      builder: (contextm, state) {
        return state.when(
          initial: () => Container(),
          loading: () => const Center(child: CircularProgressIndicator()),
          data: (shows) => ListView.builder(
            itemBuilder: (context, index) {
              final show = shows[index];
              return TvCard(show);
            },
            itemCount: shows.length,
          ),
          error: (message) => Center(
            key: const Key('error_message'),
            child: Text(message),
          ),
        );
      },
    );
  }
}
