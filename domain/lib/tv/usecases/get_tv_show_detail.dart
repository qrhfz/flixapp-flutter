import '../../utils/typealias.dart';
import '../repository/tv_show_repository.dart';

class GetTVShowDetail {
  final TVShowRepository repository;

  GetTVShowDetail(this.repository);

  TvShowDetailOrFailureFuture call(int id) {
    return repository.getTvShowDetail(id);
  }
}
