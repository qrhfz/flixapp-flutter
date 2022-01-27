import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';
import 'package:ditonton/common/usecase.dart';
import 'package:equatable/equatable.dart';

class GetTvShowDetail
    implements UseCase<FutureTvShowDetail, GetTvShowDetailParams> {
  final TvShowRepository repository;

  GetTvShowDetail(this.repository);

  @override
  FutureTvShowDetail execute(GetTvShowDetailParams params) {
    return repository.getTvShowDetail(params.id);
  }
}

class GetTvShowDetailParams extends Equatable {
  final int id;

  GetTvShowDetailParams(this.id);

  @override
  List<Object?> get props => [id];
}
