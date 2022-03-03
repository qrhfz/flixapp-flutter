import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/presentation/provider/tv_show_search_notifier.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:ditonton/presentation/widgets/tv_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../cubit/search_cubit.dart';

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
  final TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

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
              controller: controller,
              onSubmitted: (query) {
                if (mode == SearchMode.movie) {
                  BlocProvider.of<SearchCubit>(context, listen: false)
                      .fetchMovieSearch(query);
                } else {
                  BlocProvider.of<SearchCubit>(context, listen: false)
                      .fetchTVShowSearch(query);
                }
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
                      BlocProvider.of<SearchCubit>(context, listen: false)
                          .fetchMovieSearch(controller.text);
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
                      BlocProvider.of<SearchCubit>(context, listen: false)
                          .fetchTVShowSearch(controller.text);
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
            BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
              return state.when(
                initial: () => Expanded(child: Container()),
                loading: () => Center(child: CircularProgressIndicator()),
                movieResult: (movies) => Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (_, index) => MovieCard(movies[index]),
                    itemCount: movies.length,
                  ),
                ),
                tvResult: (shows) => Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (_, index) => TvCard(shows[index]),
                    itemCount: shows.length,
                  ),
                ),
                error: (message) => Expanded(child: Text(message)),
              );
            })
          ],
        ),
      ),
    );
  }
}
