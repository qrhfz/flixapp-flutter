import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/repositories/tv_show_repository.dart';

class GetPopularTVShows {
  final TVShowRepository tvRepository;

  GetPopularTVShows(this.tvRepository);

  Future<Either<Failure, List<TVShow>>> call() {
    return tvRepository.getPopularTvShows();
  }
}
