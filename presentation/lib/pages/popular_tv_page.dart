import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/tv_show_list_notifier.dart';
import '../widgets/tv_card.dart';

class PopularTvPage extends StatefulWidget {
  static const route = '/tv/popular';
  const PopularTvPage({Key? key}) : super(key: key);

  @override
  _PopularTvPageState createState() => _PopularTvPageState();
}

class _PopularTvPageState extends State<PopularTvPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popular Tv Series')),
      body: Consumer<TVShowListNotifier>(
        builder: (context, provider, _) {
          final popularList = provider.popularList;
          return ListView.builder(
            itemCount: popularList.length,
            itemBuilder: (context, index) => TvCard(popularList[index]),
          );
        },
      ),
    );
  }
}
