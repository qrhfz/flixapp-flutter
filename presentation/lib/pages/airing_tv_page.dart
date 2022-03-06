import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/tv_show_airing_cubit.dart';

import '../widgets/tv_card.dart';

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
      appBar: AppBar(title: const Text('Now Airing')),
      body: BlocBuilder<TvShowAiringCubit, TvShowAiringState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            data: (shows) => ListView.builder(
              itemCount: shows.length,
              itemBuilder: (context, index) => TvCard(shows[index]),
            ),
            error: (message) {
              return Center(
                child: Text(
                  message,
                  key: const Key('error_message'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
