import 'package:ditonton/presentation/provider/tv_show_list_notifier.dart';
import 'package:ditonton/presentation/widgets/tv_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AiringTVShowPage extends StatefulWidget {
  static const route = '/tv/airing';
  const AiringTVShowPage({Key? key}) : super(key: key);

  @override
  _AiringTVShowPageState createState() => _AiringTVShowPageState();
}

class _AiringTVShowPageState extends State<AiringTVShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Now Airing')),
      body: Consumer<TVShowListNotifier>(
        builder: (context, provider, _) => ListView.builder(
          itemCount: provider.airingList.length,
          itemBuilder: (context, index) => TvCard(provider.airingList[index]),
        ),
      ),
    );
  }
}
