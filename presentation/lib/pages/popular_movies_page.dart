import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/movie_popular_cubit.dart';
import '../widgets/movie_card_list.dart';

class PopularMoviesPage extends StatefulWidget {
  static const routeName = '/popular-movie';

  const PopularMoviesPage({Key? key}) : super(key: key);

  @override
  _PopularMoviesPageState createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        BlocProvider.of<MoviePopularCubit>(context, listen: false)
            .fetchPopularMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<MoviePopularCubit, MoviePopularState>(
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
