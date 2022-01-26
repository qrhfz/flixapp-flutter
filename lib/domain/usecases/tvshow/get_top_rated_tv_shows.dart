import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';
import 'package:ditonton/domain/usecases/usecase.dart';

class GetTopRatedTvShows implements UseCase {
  final TvShowRepository repository;

  GetTopRatedTvShows(this.repository);

  @override
  Future<Either<Failure, List<TvShow>>> execute() async {
    return await repository.getTopRatedTvSeries();
  }
}
