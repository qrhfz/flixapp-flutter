import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';
import 'package:ditonton/common/usecase.dart';

class GetTvShowDetail implements UseCase<FutureTvShowDetail, int> {
  final TvShowRepository repository;

  GetTvShowDetail(this.repository);

  @override
  FutureTvShowDetail execute(arg) {
    return repository.getTvShowDetail(arg);
  }
}
