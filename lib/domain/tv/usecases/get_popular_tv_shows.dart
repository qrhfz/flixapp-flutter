import 'package:ditonton/domain/tv/repository/tv_show_repository.dart';

import '../../utils/typealias.dart';

class GetPopularTVShows {
  final TVShowRepository tvRepository;

  GetPopularTVShows(this.tvRepository);

  TvShowsOrFailureFuture call() => tvRepository.getPopularTVShows();
}
