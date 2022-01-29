import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/models/tv_show_table.dart';

abstract class TvLocalDataSource {
  Future<Either<Failure, List<TvShowTable>>> findAll();
  Future<Either<Failure, String>> save(TvShowTable tvShow);
  Future<Either<Failure, String>> delete(int id);
  Future<Either<Failure, TvShowTable?>> findOneOrNull(int id);
}
