import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/utils/failure.dart';
import 'package:ditonton/domain/movie/entities/movie.dart';
import 'package:ditonton/domain/movie/repository/movie_repository.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute(String query) {
    return repository.searchMovies(query);
  }
}
