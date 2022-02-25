import 'dart:developer';

import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/presentation/provider/movie_search_notifier.dart';
import 'package:ditonton/presentation/provider/tv_show_search_notifier.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:ditonton/presentation/widgets/tv_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum SearchMode {
  movie,
  tv,
}

class SearchPage extends StatefulWidget {
  static const ROUTE_NAME = '/search';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchMode mode = SearchMode.movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
                Provider.of<MovieSearchNotifier>(context, listen: false)
                    .fetchMovieSearch(query);

                Provider.of<TVShowSearchNotifier>(context, listen: false)
                    .fetchTvSearch(query);
              },
              decoration: InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            Row(
              children: [
                InputChip(
                  showCheckmark: false,
                  label: Text('Movie'),
                  onSelected: (_) {
                    setState(() {
                      mode = SearchMode.movie;
                    });
                  },
                  selected: mode == SearchMode.movie,
                ),
                SizedBox(width: 8),
                InputChip(
                  showCheckmark: false,
                  label: Text('Tv Show'),
                  onSelected: (_) {
                    setState(() {
                      mode = SearchMode.tv;
                    });
                  },
                  selected: mode == SearchMode.tv,
                ),
              ],
            ),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            if (mode == SearchMode.movie)
              Consumer<MovieSearchNotifier>(
                builder: (context, data, _) => _MovieSearchResult(
                  state: data.state,
                  movies: data.moviesSearchResult,
                ),
              )
            else
              Consumer<TVShowSearchNotifier>(
                builder: (context, data, _) => _TVSearchResult(
                  state: data.state,
                  tvList: data.tvSearchResult,
                  message: data.message,
                ),
              )
          ],
        ),
      ),
    );
  }
}

class _MovieSearchResult extends StatelessWidget {
  final RequestState state;
  final List<Movie> movies;

  const _MovieSearchResult({
    required this.state,
    required this.movies,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state == RequestState.Loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state == RequestState.Loaded) {
      return Expanded(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            final movie = movies[index];
            return MovieCard(movie);
          },
          itemCount: movies.length,
        ),
      );
    } else {
      return Expanded(
        child: Container(),
      );
    }
  }
}

class _TVSearchResult extends StatelessWidget {
  final RequestState state;
  final List<TVShow> tvList;
  final String message;

  const _TVSearchResult({
    required this.state,
    required this.tvList,
    required this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state == RequestState.Loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state == RequestState.Loaded) {
      return Expanded(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            final tv = tvList[index];
            return TvCard(tv);
          },
          itemCount: tvList.length,
        ),
      );
    } else {
      return Expanded(
        child: Text(message),
      );
    }
  }
}
