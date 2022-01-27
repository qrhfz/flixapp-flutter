import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';
import 'package:ditonton/domain/usecases/usecase.dart';

class GetAiringTvShows implements UseCase {
  final TvShowRepository repository;

  GetAiringTvShows(this.repository);

  @override
  Future<Either<Failure, List<TvShow>>> execute() async {
    return repository.getAiringTvShows();
  }
}
