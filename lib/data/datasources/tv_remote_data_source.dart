import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/api_key.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/data/models/tv_show_detail_model.dart';
import 'package:ditonton/data/models/tv_show_list_response.dart';
import 'package:ditonton/data/models/tv_show_model.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

abstract class TvRemoteDataSource {
  TvShowModelssOrFailureFuture getPopularTvShows();
  TvShowModelssOrFailureFuture getTopRatedTvShows();
  TvShowModelssOrFailureFuture getAiringTvShows();
  TvShowDetailModelOrFailureFuture getTvShowDetail(int id);
  TvShowModelssOrFailureFuture searchTvShow(String query);
}

class TvRemoteDataSourceImpl implements TvRemoteDataSource {
  final authority = 'api.themoviedb.org';
  final http.Client client;

  static final airingPath = '/3/tv/on_the_air';
  static final popularPath = '/3/tv/popular';
  static final topRatedPath = '/3/tv/top_rated';
  static final searchPath = '/3/search/tv';
  static final basePath = '/3/tv';

  TvRemoteDataSourceImpl(this.client);

  @override
  TvShowModelssOrFailureFuture getAiringTvShows() async {
    try {
      final res = await client
          .get(Uri.https(authority, airingPath, {'api_key': apiKey}));
      final json = jsonDecode(res.body);
      final tvShowListResponse = TvShowListResponse.fromJson(json);
      return Right(tvShowListResponse.results);
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure("Gagal menghubungi server")));
    }
  }

  @override
  TvShowModelssOrFailureFuture getPopularTvShows() async {
    try {
      final res = await client
          .get(Uri.https(authority, popularPath, {'api_key': apiKey}));
      final json = jsonDecode(res.body);
      final tvShowListResponse = TvShowListResponse.fromJson(json);
      return Right(tvShowListResponse.results);
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure("Gagal menghubungi server")));
    }
  }

  @override
  TvShowModelssOrFailureFuture getTopRatedTvShows() async {
    try {
      final res = await client
          .get(Uri.https(authority, topRatedPath, {'api_key': apiKey}));
      final json = jsonDecode(res.body);
      final tvShowListResponse = TvShowListResponse.fromJson(json);
      return Right(tvShowListResponse.results);
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure("Gagal menghubungi server")));
    }
  }

  @override
  TvShowDetailModelOrFailureFuture getTvShowDetail(int id) async {
    try {
      final res = await client.get(
        Uri.https(
          authority,
          path.join(basePath, id.toString()),
          {'api_key': apiKey},
        ),
      );
      final json = jsonDecode(res.body);
      final tvShowDetail = TvShowDetailModel.fromJson(json);
      return Right(tvShowDetail);
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure("Gagal menghubungi server")));
    }
  }

  @override
  TvShowModelssOrFailureFuture searchTvShow(String query) async {
    try {
      final res = await client.get(
        Uri.https(
          authority,
          searchPath,
          {
            'api_key': apiKey,
            'query': query,
          },
        ),
      );
      final json = jsonDecode(res.body);
      final tvShowListResponse = TvShowListResponse.fromJson(json);
      return Right(tvShowListResponse.results);
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure("Gagal menghubungi server")));
    }
  }
}
