import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:flutter/material.dart';

class TvListPage extends StatelessWidget {
  const TvListPage({Key? key}) : super(key: key);

  static const ROUTE_NAME = '/tv';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TV SERIES'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(children: []),
        ),
      ),
    );
  }
}

class _HorizontalTvListView extends StatelessWidget {
  final List<TvShow> tvlist;

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
                // Navigator.pushNamed(
                //   context,
                //   MovieDetailPage.ROUTE_NAME,
                //   arguments: movie.id,
                // );
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
