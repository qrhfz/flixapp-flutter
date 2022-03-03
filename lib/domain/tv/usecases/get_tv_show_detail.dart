import 'package:ditonton/domain/utils/typealias.dart';
import 'package:ditonton/domain/tv/repository/tv_show_repository.dart';

class GetTVShowDetail {
  final TVShowRepository repository;

  GetTVShowDetail(this.repository);

  TvShowDetailOrFailureFuture call(int id) {
    return repository.getTvShowDetail(id);
  }
}
