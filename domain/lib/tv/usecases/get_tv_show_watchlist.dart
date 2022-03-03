import '../../utils/typealias.dart';
import '../repository/tv_show_repository.dart';

class GetTVShowWatchlist {
  final TVShowRepository repository;

  GetTVShowWatchlist(this.repository);

  TvShowsOrFailureFuture call() {
    return repository.getTvShowWatchlist();
  }
}
