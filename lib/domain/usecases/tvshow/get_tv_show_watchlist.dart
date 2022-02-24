import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetTvShowWatchlist {
  final TvShowRepository repository;

  GetTvShowWatchlist(this.repository);

  TvShowsOrFailureFuture call() {
    return repository.getTvShowWatchlist();
  }
}
