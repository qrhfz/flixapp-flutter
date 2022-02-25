import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetAiringTVShows {
  final TVShowRepository repository;

  GetAiringTVShows(this.repository);

  TvShowsOrFailureFuture call() async {
    return repository.getAiringTvShows();
  }
}
