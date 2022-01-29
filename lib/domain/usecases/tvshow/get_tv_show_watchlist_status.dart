import 'package:ditonton/common/usecase.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetTvShowWatchlistStatus implements UseCase<Future<bool>, int> {
  final TvShowRepository repository;

  GetTvShowWatchlistStatus(this.repository);

  @override
  Future<bool> execute(int arg) {
    return repository.getWatchlistStatus(arg);
  }
}
