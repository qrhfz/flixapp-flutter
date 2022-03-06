import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/cubit/tv_show_popular_cubit.dart';
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
      body: BlocBuilder<TvShowPopularCubit, TvShowPopularState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            data: (shows) => ListView.builder(
              itemCount: shows.length,
              itemBuilder: (context, index) => TvCard(shows[index]),
            ),
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }
}
