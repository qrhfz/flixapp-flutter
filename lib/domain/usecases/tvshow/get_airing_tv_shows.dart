import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetAiringTvShows {
  final TvShowRepository repository;

  GetAiringTvShows(this.repository);

  TvShowsOrFailureFuture call() async {
    return repository.getAiringTvShows();
  }
}
