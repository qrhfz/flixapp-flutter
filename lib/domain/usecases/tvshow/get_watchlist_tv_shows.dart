import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/common/usecase.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetWatchlistTvShows implements UseCase<TvShowsOrFailureFuture, void> {
  final TvShowRepository repository;

  GetWatchlistTvShows(this.repository);

  @override
  TvShowsOrFailureFuture execute(_) {
    return repository.getTvShowWatchlist();
  }
}
