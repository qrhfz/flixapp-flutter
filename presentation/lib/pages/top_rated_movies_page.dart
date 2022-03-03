import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/movie_top_rated_cubit.dart';
import '../widgets/movie_card_list.dart';

class TopRatedMoviesPage extends StatefulWidget {
  static const routeName = '/top-rated-movie';

  const TopRatedMoviesPage({Key? key}) : super(key: key);

  @override
  _TopRatedMoviesPageState createState() => _TopRatedMoviesPageState();
}

class _TopRatedMoviesPageState extends State<TopRatedMoviesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        BlocProvider.of<MovieTopRatedCubit>(context, listen: false)
            .fetchTopRatedMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<MovieTopRatedCubit, MovieTopRatedState>(
            builder: (context, state) {
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
        }),
      ),
    );
  }
}
