import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';
import 'package:ditonton/common/usecase.dart';

class GetTopRatedTvShows implements UseCase<FutureTvShowList, NoParams> {
  final TvShowRepository repository;

  GetTopRatedTvShows(this.repository);

  @override
  Future<Either<Failure, List<TvShow>>> execute(_) async {
    return await repository.getTopRatedTvShows();
  }
}
