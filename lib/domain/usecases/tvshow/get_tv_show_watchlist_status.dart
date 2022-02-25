import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetTVShowWatchlistStatus {
  final TVShowRepository repository;

  GetTVShowWatchlistStatus(this.repository);

  Future<bool> call(int id) {
    return repository.getWatchlistStatus(id);
  }
}
