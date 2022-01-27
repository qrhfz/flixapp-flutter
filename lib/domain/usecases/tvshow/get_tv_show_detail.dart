import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';
import 'package:ditonton/common/usecase.dart';

class GetTvShowDetail
    implements UseCase<FutureTvShowDetail, GetTvShowDetailParams> {
  final TvShowRepository repository;

  GetTvShowDetail(this.repository);

  @override
  FutureTvShowDetail execute(GetTvShowDetailParams params) {
    return repository.getTvShowDetail(params.id);
  }
}

class GetTvShowDetailParams {
  final int id;

  GetTvShowDetailParams(this.id);
}
