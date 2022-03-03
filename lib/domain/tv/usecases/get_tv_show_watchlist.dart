import 'package:ditonton/domain/utils/typealias.dart';
import 'package:ditonton/domain/tv/repository/tv_show_repository.dart';

class GetTVShowWatchlist {
  final TVShowRepository repository;

  GetTVShowWatchlist(this.repository);

  TvShowsOrFailureFuture call() {
    return repository.getTvShowWatchlist();
  }
}
