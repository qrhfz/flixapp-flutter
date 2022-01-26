import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';
import 'package:ditonton/domain/usecases/usecase.dart';

class GetTopRatedTvSeries implements UseCase {
  final TvRepository repository;

  GetTopRatedTvSeries(this.repository);

  @override
  Future<Either<Failure, List<Tv>>> execute() async {
    return await repository.getTopRatedTvSeries();
  }
}
