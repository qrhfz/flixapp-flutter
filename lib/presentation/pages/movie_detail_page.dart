import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/presentation/cubit/movie_recommendation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../cubit/movie_detail_cubit.dart';
import '../cubit/movie_detail_watchlist_cubit.dart';

class MovieDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail';

  final int id;
  MovieDetailPage({required this.id});

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<MovieDetailCubit>(context, listen: false)
          .fetchMovieDetail(widget.id);
      BlocProvider.of<MovieDetailWatchlistCubit>(context, listen: false)
          .loadWatchlistStatus(widget.id);
      BlocProvider.of<MovieRecommendationCubit>(context, listen: false)
          .fetchRecommendations(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
        builder: (context, state) {
      return state.when(
        initial: () => Container(),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        data: (movie) =>
            BlocListener<MovieDetailWatchlistCubit, MovieDetailWatchlistState>(
          listener: (BuildContext context, state) {
            state.maybeWhen(
              error: (message) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(message),
                      );
                    });
              },
              success: (message) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              },
              orElse: () => null,
            );
          },
          child: DetailContent(movie),
        ),
        error: (errorMessage) => Text(errorMessage),
      );
    }));
  }
}

class DetailContent extends StatelessWidget {
  final MovieDetail movie;

  DetailContent(this.movie);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: kHeading5,
                            ),
                            BlocBuilder<MovieDetailWatchlistCubit,
                                MovieDetailWatchlistState>(
                              buildWhen: (_, current) {
                                return current.maybeWhen(
                                  data: (_) => true,
                                  orElse: () => false,
                                );
                              },
                              builder: (context, state) {
                                return state.maybeWhen(
                                  data: (isAddedWatchlist) => WatchlistButton(
                                    movie: movie,
                                    isAddedWatchlist: isAddedWatchlist,
                                  ),
                                  orElse: () => SizedBox.shrink(),
                                );
                              },
                            ),
                            Text(
                              movie.genres.asString(),
                            ),
                            Text(
                              _showDuration(movie.runtime),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: movie.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${movie.voteAverage}')
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              movie.overview,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            BlocBuilder<MovieRecommendationCubit,
                                MovieRecommendationState>(
                              builder: (context, state) {
                                return state.when(
                                  initial: () => SizedBox.shrink(),
                                  loading: () => CircularProgressIndicator(),
                                  data: (movies) => RecommendationListWidget(
                                    recommendations: movies,
                                  ),
                                  error: (errorMessage) => Center(
                                    child: Text(errorMessage),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.25,
            // maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}

class RecommendationListWidget extends StatelessWidget {
  const RecommendationListWidget({
    Key? key,
    required this.recommendations,
  }) : super(key: key);
  final List<Movie> recommendations;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = recommendations[index];
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  MovieDetailPage.ROUTE_NAME,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: recommendations.length,
      ),
    );
  }
}

class WatchlistButton extends StatelessWidget {
  const WatchlistButton({
    Key? key,
    required this.movie,
    required this.isAddedWatchlist,
  }) : super(key: key);

  final MovieDetail movie;
  final bool isAddedWatchlist;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (!isAddedWatchlist) {
          await BlocProvider.of<MovieDetailWatchlistCubit>(context,
                  listen: false)
              .addWatchlist(movie);
        } else {
          await BlocProvider.of<MovieDetailWatchlistCubit>(context,
                  listen: false)
              .removeFromWatchlist(movie);
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          isAddedWatchlist ? Icon(Icons.check) : Icon(Icons.add),
          Text('Watchlist'),
        ],
      ),
    );
  }
}
