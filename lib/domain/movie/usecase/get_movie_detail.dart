import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/movie/entities/movie_detail.dart';
import 'package:ditonton/domain/movie/repository/movie_repository.dart';
import 'package:ditonton/domain/utils/failure.dart';

class GetMovieDetail {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  Future<Either<Failure, MovieDetail>> execute(int id) {
    return repository.getMovieDetail(id);
  }
}
