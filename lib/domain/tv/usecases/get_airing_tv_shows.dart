import 'package:ditonton/domain/utils/typealias.dart';
import 'package:ditonton/domain/tv/repository/tv_show_repository.dart';

class GetAiringTVShows {
  final TVShowRepository repository;

  GetAiringTVShows(this.repository);

  TvShowsOrFailureFuture call() async {
    return repository.getAiringTVShows();
  }
}
