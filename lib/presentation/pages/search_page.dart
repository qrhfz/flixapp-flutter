import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/movie_search_notifier.dart';
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

                Provider.of<MovieSearchNotifier>(context, listen: false)
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
            Consumer<MovieSearchNotifier>(
              builder: (context, data, child) {
                if (data.state == RequestState.Loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (data.state == RequestState.Loaded) {
                  if (mode == SearchMode.movie) {
                    final result = data.moviesSearchResult;
                    return Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (context, index) {
                          final movie = result[index];
                          return MovieCard(movie);
                        },
                        itemCount: result.length,
                      ),
                    );
                  } else {
                    final result = data.tvSearchResult;
                    return Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (context, index) {
                          final tv = result[index];
                          return TvCard(tv);
                        },
                        itemCount: result.length,
                      ),
                    );
                  }
                } else {
                  return Expanded(
                    child: Container(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
