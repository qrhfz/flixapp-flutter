import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/pages/movie_detail_page.dart';
import 'package:presentation/pages/popular_movies_page.dart';
import 'package:presentation/pages/search_page.dart';
import 'package:presentation/pages/top_rated_movies_page.dart';

import '../cubit/movie_now_playing_cubit.dart';
import '../cubit/movie_popular_cubit.dart';
import '../cubit/movie_top_rated_cubit.dart';
import '../helper/constants.dart';
import '../helper/styles.dart';
import '../widgets/app_drawer.dart';
import '../widgets/sub_heading.dart';

class HomeMoviePage extends StatefulWidget {
  const HomeMoviePage({Key? key}) : super(key: key);

  @override
  _HomeMoviePageState createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<MovieNowPlayingCubit>(context, listen: false)
          .fetchNowPlayingMovies();
      BlocProvider.of<MoviePopularCubit>(context, listen: false)
          .fetchPopularMovies();
      BlocProvider.of<MovieTopRatedCubit>(context, listen: false)
          .fetchTopRatedMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.routeName);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Now Playing',
                style: kHeading6,
              ),
              BlocBuilder<MovieNowPlayingCubit, MovieNowPlayingState>(
                  builder: (context, state) {
                return state.when(
                  initial: () => Container(),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  data: (nowPlaying) => MovieList(nowPlaying),
                  error: (_) => const Text('Failed'),
                );
              }),
              SubHeading(
                title: 'Popular',
                onTap: () =>
                    Navigator.pushNamed(context, PopularMoviesPage.routeName),
              ),
              BlocBuilder<MoviePopularCubit, MoviePopularState>(
                  builder: (context, state) {
                return state.when(
                  initial: () => Container(),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  data: (popular) => MovieList(popular),
                  error: (_) => const Text('Failed'),
                );
              }),
              SubHeading(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TopRatedMoviesPage.routeName),
              ),
              BlocBuilder<MovieTopRatedCubit, MovieTopRatedState>(
                  builder: (context, state) {
                return state.when(
                  initial: () => Container(),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  data: (topRated) => MovieList(topRated),
                  error: (_) => const Text('Failed'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  const MovieList(this.movies, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailPage.routeName,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageURL${movie.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
