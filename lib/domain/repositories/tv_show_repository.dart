import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';

abstract class TvShowRepository {
  FutureTvShowList getPopularTvShows();
  FutureTvShowList getTopRatedTvShows();
  FutureTvShowList getAiringTvShows();
  FutureTvShowDetail getTvShowDetail(int id);
  FutureTvShowList searchTvShows(String query);
  FutureTvShowList getTvShowWatchlist();
  Future<Either<Failure, String>> saveWatchlist(TvShowDetail tv);
  Future<Either<Failure, String>> deleteWatchlist(int id);
  Future<bool> isInWatchlist(int id);
}
