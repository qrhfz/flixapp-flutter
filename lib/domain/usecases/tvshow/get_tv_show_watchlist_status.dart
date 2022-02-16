import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetTvShowWatchlistStatus {
  final TvShowRepository repository;

  GetTvShowWatchlistStatus(this.repository);

  Future<bool> call(int id) {
    return repository.getWatchlistStatus(id);
  }
}
