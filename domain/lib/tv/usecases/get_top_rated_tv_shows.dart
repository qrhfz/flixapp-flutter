import '../../utils/typealias.dart';
import '../repository/tv_show_repository.dart';

class GetTopRatedTVShows {
  final TVShowRepository repository;

  GetTopRatedTVShows(this.repository);

  TvShowsOrFailureFuture call() async {
    return await repository.getTopRatedTvShows();
  }
}
