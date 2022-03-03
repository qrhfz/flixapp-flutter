import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/movie/entities/movie.dart';
import 'package:ditonton/domain/movie/repository/movie_repository.dart';
import 'package:ditonton/domain/utils/failure.dart';

class GetMovieRecommendations {
  final MovieRepository repository;

  GetMovieRecommendations(this.repository);

  Future<Either<Failure, List<Movie>>> execute(id) {
    return repository.getMovieRecommendations(id);
  }
}
