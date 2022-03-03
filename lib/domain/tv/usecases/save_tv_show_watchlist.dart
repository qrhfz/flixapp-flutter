import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/utils/failure.dart';
import 'package:ditonton/domain/tv/entities/tv_show_detail.dart';
import 'package:ditonton/domain/tv/repository/tv_show_repository.dart';

class SaveTVShowWatchlist {
  final TVShowRepository repository;

  SaveTVShowWatchlist(this.repository);

  Future<Either<Failure, String>> call(TVShowDetail tvShowDetail) {
    return repository.saveWatchlist(tvShowDetail);
  }
}
