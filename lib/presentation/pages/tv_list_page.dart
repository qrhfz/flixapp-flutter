import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/presentation/utils/styles.dart';
import 'package:ditonton/domain/tv/entities/tv_show.dart';
import 'package:ditonton/presentation/pages/airing_tv_page.dart';
import 'package:ditonton/presentation/pages/popular_tv_page.dart';
import 'package:ditonton/presentation/pages/tv_detail_page.dart';
import 'package:ditonton/presentation/provider/tv_show_list_notifier.dart';
import 'package:ditonton/presentation/widgets/app_drawer.dart';
import 'package:ditonton/presentation/widgets/sub_heading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
import 'search_page.dart';

class TvListPage extends StatefulWidget {
  const TvListPage({Key? key}) : super(key: key);

  static const ROUTE_NAME = '/tv';

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
        title: Text('TV SERIES'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
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
            SubHeading(title: 'Top Rated'),
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

  _HorizontalTvListView(this.tvlist);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tv.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
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
