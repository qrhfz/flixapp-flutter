import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';
import 'package:ditonton/domain/usecases/usecase.dart';

class GetTvShowDetail implements UseCase {
  final TvShowRepository repository;
  final int id;

  GetTvShowDetail(this.id, this.repository);

  @override
  Future<Either<Failure, TvShowDetail>> execute() {
    return repository.getTvShowDetail(id);
  }
}
