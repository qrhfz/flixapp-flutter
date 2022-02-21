import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/api_key.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/typealias.dart';
import 'package:ditonton/data/models/tv_show_detail_model.dart';
import 'package:ditonton/data/models/tv_show_list_response.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

abstract class TvRemoteDataSource {
  TvShowModelsOrFailureFuture getPopularTvShows();
  TvShowModelsOrFailureFuture getTopRatedTvShows();
  TvShowModelsOrFailureFuture getAiringTvShows();
  TvShowDetailModelOrFailureFuture getTvShowDetail(int id);
  TvShowModelsOrFailureFuture searchTvShow(String query);
  TvShowModelsOrFailureFuture getTvShowRecommendations(int id);
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
  TvShowModelsOrFailureFuture getAiringTvShows() async {
    try {
      final res = await client
          .get(Uri.https(authority, airingPath, {'api_key': apiKey}));
      final json = jsonDecode(res.body);
      final tvShowListResponse = TvShowListResponse.fromJson(json);
      return Right(tvShowListResponse.results);
    } on SocketException {
      return Left(ConnectionFailure());
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  TvShowModelsOrFailureFuture getPopularTvShows() async {
    try {
      final res = await client
          .get(Uri.https(authority, popularPath, {'api_key': apiKey}));
      final json = jsonDecode(res.body);
      final tvShowListResponse = TvShowListResponse.fromJson(json);
      return Right(tvShowListResponse.results);
    } on SocketException {
      return Left(ConnectionFailure());
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  TvShowModelsOrFailureFuture getTopRatedTvShows() async {
    try {
      final res = await client
          .get(Uri.https(authority, topRatedPath, {'api_key': apiKey}));
      final json = jsonDecode(res.body);
      final tvShowListResponse = TvShowListResponse.fromJson(json);
      return Right(tvShowListResponse.results);
    } on SocketException {
      return Left(ConnectionFailure());
    } on Exception {
      return Left(ServerFailure());
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
    } on SocketException {
      return Left(ConnectionFailure());
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  TvShowModelsOrFailureFuture searchTvShow(String query) async {
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
    } on SocketException {
      return Left(ConnectionFailure());
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  TvShowModelsOrFailureFuture getTvShowRecommendations(int id) async {
    try {
      final res = await client.get(
        Uri.https(
          authority,
          path.join(basePath, id.toString(), 'recommendations'),
          {
            'api_key': apiKey,
          },
        ),
      );
      final json = jsonDecode(res.body);
      final tvShowListResponse = TvShowListResponse.fromJson(json);
      return Right(tvShowListResponse.results);
    } on SocketException {
      return Left(ConnectionFailure());
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
