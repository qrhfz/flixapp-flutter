import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:http/http.dart' as http;

abstract class TvRemoteDataSource {
  TvShowModelssOrFailureFuture getPopularTvShows();
  TvShowModelssOrFailureFuture getTopRatedTvShows();
  TvShowModelssOrFailureFuture getAiringTvShows();
  TvShowDetailModelOrFailureFuture getTvShowDetail(int id);
  TvShowModelssOrFailureFuture searchTvShow(String query);
}

class TvRemoteDataSourceImpl implements TvRemoteDataSource {
  final http.Client client;

  TvRemoteDataSourceImpl(this.client);

  @override
  TvShowModelssOrFailureFuture getAiringTvShows() {
    // TODO: implement getAiringTvShows
    throw UnimplementedError();
  }

  @override
  TvShowModelssOrFailureFuture getPopularTvShows() {
    // TODO: implement getPopularTvShows
    throw UnimplementedError();
  }

  @override
  TvShowModelssOrFailureFuture getTopRatedTvShows() {
    // TODO: implement getTopRatedTvShows
    throw UnimplementedError();
  }

  @override
  TvShowDetailModelOrFailureFuture getTvShowDetail(int id) {
    // TODO: implement getTvShowDetail
    throw UnimplementedError();
  }

  @override
  TvShowModelssOrFailureFuture searchTvShow(String query) {
    // TODO: implement searchTvShow
    throw UnimplementedError();
  }
}
