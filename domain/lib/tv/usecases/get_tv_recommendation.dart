import '../../utils/typealias.dart';
import '../repository/tv_show_repository.dart';

class GetTvRecommendations {
  final TVShowRepository repository;
  GetTvRecommendations(this.repository);

  TvShowsOrFailureFuture call(int id) => repository.getTvRecommendations(id);
}
