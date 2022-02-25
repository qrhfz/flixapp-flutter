import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetTVShowWatchlist {
  final TVShowRepository repository;

  GetTVShowWatchlist(this.repository);

  TvShowsOrFailureFuture call() {
    return repository.getTvShowWatchlist();
  }
}
