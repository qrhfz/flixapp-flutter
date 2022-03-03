import 'package:ditonton/domain/utils/typealias.dart';

import 'package:ditonton/domain/tv/repository/tv_show_repository.dart';

class GetTopRatedTVShows {
  final TVShowRepository repository;

  GetTopRatedTVShows(this.repository);

  TvShowsOrFailureFuture call() async {
    return await repository.getTopRatedTvShows();
  }
}
