import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/presentation/utils/utils.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../utils/styles.dart';
import '../utils/state_enum.dart';
import '../provider/tv_show_detail_notifier.dart';

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
      Provider.of<TVShowDetailNotifier>(context, listen: false)
          .fetchDetail(widget.id);
      Provider.of<TVShowDetailNotifier>(context, listen: false)
          .fetchRecommendations(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TVShowDetailNotifier>(
        builder: (context, provider, child) {
          if (provider.detailState == RequestState.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.detailState == RequestState.Loaded) {
            final tv = provider.tv;
            return SafeArea(
              child: _DetailContent(
                tv,
                provider.recommendations,
                provider.isAddedToWatchlist,
              ),
            );
          } else {
            return Text(provider.message);
          }
        },
      ),
    );
  }
}

class _DetailContent extends StatelessWidget {
  final TVShowDetail tv;
  final List<TVShow> recommendations;
  final bool isAddedWatchlist;

  _DetailContent(
    this.tv,
    this.recommendations,
    this.isAddedWatchlist,
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${tv.posterPath}',
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
                              tv.title,
                              style: kHeading5,
                            ),
                            TvWatchlistButton(
                              isAddedWatchlist: isAddedWatchlist,
                              tv: tv,
                            ),
                            Text(
                              tv.genres.asString(),
                            ),
                            // Text(
                            //   _showDuration(tv.runtime),
                            // ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: (tv.voteAverage ?? 0) / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${tv.voteAverage}')
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              tv.overview,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            Consumer<TVShowDetailNotifier>(
                              builder: (context, data, child) {
                                return TvRecommendationList(
                                  message: data.message,
                                  recommendations: data.recommendations,
                                  recommendationsState:
                                      data.recommendationsState,
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
}

class TvWatchlistButton extends StatelessWidget {
  const TvWatchlistButton({
    Key? key,
    required this.isAddedWatchlist,
    required this.tv,
  }) : super(key: key);

  final bool isAddedWatchlist;
  final TVShowDetail tv;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (!isAddedWatchlist) {
          await Provider.of<TVShowDetailNotifier>(context, listen: false)
              .addWatchlist();
        } else {
          await Provider.of<TVShowDetailNotifier>(context, listen: false)
              .removeFromWatchlist();
        }

        final message =
            Provider.of<TVShowDetailNotifier>(context, listen: false)
                .watchlistMessage;

        if (message == TVShowDetailNotifier.watchlistAddSuccessMessage ||
            message == TVShowDetailNotifier.watchlistRemoveSuccessMessage) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(message),
              );
            },
          );
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

class TvRecommendationList extends StatelessWidget {
  const TvRecommendationList({
    Key? key,
    required this.recommendationsState,
    required this.message,
    required this.recommendations,
  }) : super(key: key);

  final RequestState recommendationsState;
  final String message;
  final List<TVShow> recommendations;

  @override
  Widget build(BuildContext context) {
    if (recommendationsState == RequestState.Loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (recommendationsState == RequestState.Error) {
      return Text(message);
    } else if (recommendationsState == RequestState.Loaded) {
      return Container(
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
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: 'https://image.tmdb.org/t/p/w500${tv.posterPath}',
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
    } else {
      return Container();
    }
  }
}
