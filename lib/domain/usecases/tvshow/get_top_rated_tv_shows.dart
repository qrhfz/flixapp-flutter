import 'package:ditonton/common/typealias.dart';

import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetTopRatedTvShows {
  final TvShowRepository repository;

  GetTopRatedTvShows(this.repository);

  TvShowsOrFailureFuture call() async {
    return await repository.getTopRatedTvShows();
  }
}
