import '../../utils/typealias.dart';
import '../repository/tv_show_repository.dart';

class GetAiringTVShows {
  final TVShowRepository repository;

  GetAiringTVShows(this.repository);

  TvShowsOrFailureFuture call() async {
    return repository.getAiringTVShows();
  }
}
