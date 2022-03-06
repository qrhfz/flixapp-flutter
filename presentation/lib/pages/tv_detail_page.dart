import 'package:cached_network_image/cached_network_image.dart';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:presentation/cubit/cubit.dart';
import 'package:presentation/helper/utilities.dart';
import 'package:provider/provider.dart';

import '../helper/styles.dart';

class TvDetailPage extends StatefulWidget {
  static const route = 'tv/detail';
  final int id;
  const TvDetailPage(this.id, {Key? key}) : super(key: key);

  @override
  _TvDetailPageState createState() => _TvDetailPageState();
}

class _TvDetailPageState extends State<TvDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<TvShowDetailCubit>(context, listen: false)
          .fetchDetail(widget.id);
      BlocProvider.of<TvShowDetailWatchlistCubit>(context, listen: false)
          .loadWatchlistStatus(widget.id);
      BlocProvider.of<TvShowRecommendationCubit>(context, listen: false)
          .fetchRecommendation(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TvShowDetailCubit, TvShowDetailState>(
        builder: (context, state) {
          return state.when(
            initial: () => Container(),
            loading: () => const Center(child: CircularProgressIndicator()),
            data: (show) => BlocListener<TvShowDetailWatchlistCubit,
                TvShowDetailWatchlistState>(
              listener: (context, state) {
                state.maybeWhen(
                  success: (message) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(message)));
                  },
                  error: (message) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(message),
                        );
                      },
                    );
                  },
                  orElse: () {},
                );
              },
              child: SafeArea(child: _DetailContent(show)),
            ),
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }
}

class _DetailContent extends StatelessWidget {
  final TVShowDetail tv;

  const _DetailContent(this.tv);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${tv.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
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
                              tv.title,
                              style: kHeading5,
                            ),
                            BlocBuilder<TvShowDetailWatchlistCubit,
                                TvShowDetailWatchlistState>(
                              buildWhen: (_, current) => current.maybeWhen(
                                data: (_) => true,
                                orElse: () => false,
                              ),
                              builder: (context, state) {
                                return state.maybeWhen(
                                  data: (isAddedWatchlist) =>
                                      TvWatchlistButton(tv: tv),
                                  orElse: () => Container(),
                                );
                              },
                            ),
                            Text(
                              tv.genres.asString(),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: (tv.voteAverage ?? 0) / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${tv.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              tv.overview,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            BlocBuilder<TvShowRecommendationCubit,
                                TvShowRecommendationState>(
                              builder: (context, state) {
                                return state.when(
                                  initial: () => Container(),
                                  loading: () => const Center(
                                      child: CircularProgressIndicator()),
                                  data: (recommendations) =>
                                      TvRecommendationList(
                                          recommendations: recommendations),
                                  error: (message) =>
                                      Center(child: Text(message)),
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
            minChildSize: 0.25,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }
}

class TvWatchlistButton extends StatelessWidget {
  const TvWatchlistButton({Key? key, required this.tv}) : super(key: key);

  final TVShowDetail tv;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowDetailWatchlistCubit, TvShowDetailWatchlistState>(
      buildWhen: (_, current) => current.maybeWhen(
        data: (_) => true,
        orElse: () => false,
      ),
      builder: (context, state) {
        return state.maybeWhen(
          data: (isAddedWatchlist) => ElevatedButton(
            onPressed: () async {
              if (!isAddedWatchlist) {
                await BlocProvider.of<TvShowDetailWatchlistCubit>(context,
                        listen: false)
                    .saveWatchlist(tv);
              } else {
                await Provider.of<TvShowDetailWatchlistCubit>(context,
                        listen: false)
                    .removeWatchlist(tv.id);
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                isAddedWatchlist
                    ? const Icon(Icons.check)
                    : const Icon(Icons.add),
                const Text('Watchlist'),
              ],
            ),
          ),
          orElse: () => Container(),
        );
      },
    );
  }
}

class TvRecommendationList extends StatelessWidget {
  const TvRecommendationList({
    Key? key,
    required this.recommendations,
  }) : super(key: key);

  final List<TVShow> recommendations;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tv = recommendations[index];
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  TvDetailPage.route,
                  arguments: tv.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                child: CachedNetworkImage(
                  imageUrl: 'https://image.tmdb.org/t/p/w500${tv.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
