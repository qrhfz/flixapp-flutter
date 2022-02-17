import 'package:ditonton/presentation/provider/tv_list_notifier.dart';
import 'package:ditonton/presentation/widgets/tv_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AiringTvPage extends StatefulWidget {
  static const route = '/tv/airing';
  const AiringTvPage({Key? key}) : super(key: key);

  @override
  _AiringTvPageState createState() => _AiringTvPageState();
}

class _AiringTvPageState extends State<AiringTvPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Now Airing')),
      body: Consumer<TvListNotifier>(
        builder: (context, provider, _) => ListView.builder(
          itemCount: provider.airingList.length,
          itemBuilder: (context, index) => TvCard(provider.airingList[index]),
        ),
      ),
    );
  }
}
