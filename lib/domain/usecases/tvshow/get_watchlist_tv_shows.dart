import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetWatchlistTvShows {
  final TvShowRepository repository;

  GetWatchlistTvShows(this.repository);

  TvShowsOrFailureFuture call() {
    return repository.getTvShowWatchlist();
  }
}
