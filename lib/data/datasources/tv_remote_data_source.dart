import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';

abstract class TvRemoteDataSource {
  FutureTvShowList getPopularTvShows();
  FutureTvShowList getTopRatedTvShows();
  FutureTvShowList getAiringTvShows();
  Future<Either<Failure, TvShowDetail>> getTvShowDetail(int id);
  FutureTvShowList searchTvShow(String query);
}
