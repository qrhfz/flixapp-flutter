import 'package:ditonton/common/typealias.dart';

import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetTopRatedTVShows {
  final TVShowRepository repository;

  GetTopRatedTVShows(this.repository);

  TvShowsOrFailureFuture call() async {
    return await repository.getTopRatedTvShows();
  }
}
