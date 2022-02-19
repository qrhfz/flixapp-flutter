import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetTvRecommendations {
  final TvShowRepository repository;
  GetTvRecommendations(this.repository);

  TvShowsOrFailureFuture call(int id) => repository.getTvRecommendations(id);
}
