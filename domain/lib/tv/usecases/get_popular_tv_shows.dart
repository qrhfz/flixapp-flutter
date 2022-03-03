import '../../utils/typealias.dart';
import '../repository/tv_show_repository.dart';

class GetPopularTVShows {
  final TVShowRepository tvRepository;

  GetPopularTVShows(this.tvRepository);

  TvShowsOrFailureFuture call() => tvRepository.getPopularTVShows();
}
