import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/pages/popular_tv_page.dart';
import 'package:presentation/pages/tv_detail_page.dart';
import 'package:provider/provider.dart';

import '../provider/tv_show_list_notifier.dart';
import '../helper/constants.dart';
import '../widgets/app_drawer.dart';
import '../widgets/sub_heading.dart';
import 'airing_tv_page.dart';
import 'search_page.dart';

class TvListPage extends StatefulWidget {
  const TvListPage({Key? key}) : super(key: key);

  static const routeName = '/tv';

  @override
  State<TvListPage> createState() => _TvListPageState();
}

class _TvListPageState extends State<TvListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<TVShowListNotifier>(context, listen: false)
      ..fetchAiring()
      ..fetchPopular()
      ..fetchTopRated();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TV SERIES'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.routeName);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(children: [
            SubHeading(
                title: 'Now Airing',
                onTap: () {
                  Navigator.of(context).pushNamed(AiringTVShowPage.route);
                }),
            _HorizontalTvListView(
                Provider.of<TVShowListNotifier>(context).airingList),
            SubHeading(
                title: 'Popular',
                onTap: () {
                  Navigator.of(context).pushNamed(PopularTvPage.route);
                }),
            _HorizontalTvListView(
                Provider.of<TVShowListNotifier>(context).popularList),
            const SubHeading(title: 'Top Rated'),
            _HorizontalTvListView(
                Provider.of<TVShowListNotifier>(context).topRatedList),
          ]),
        ),
      ),
    );
  }
}

class _HorizontalTvListView extends StatelessWidget {
  final List<TVShow> tvlist;

  const _HorizontalTvListView(this.tvlist);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tv = tvlist[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvDetailPage.route,
                  arguments: tv.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageURL${tv.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvlist.length,
      ),
    );
  }
}
