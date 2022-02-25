import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetTVShowDetail {
  final TVShowRepository repository;

  GetTVShowDetail(this.repository);

  TvShowDetailOrFailureFuture call(int id) {
    return repository.getTvShowDetail(id);
  }
}
