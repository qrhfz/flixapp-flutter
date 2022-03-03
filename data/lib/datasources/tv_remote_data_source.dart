import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

import '../models/tv_show_detail_model.dart';
import '../models/tv_show_list_response.dart';
import '../utils/typealias.dart';

abstract class TVShowRemoteDataSource {
  TvShowModelsOrFailureFuture getPopularTvShows();
  TvShowModelsOrFailureFuture getTopRatedTvShows();
  TvShowModelsOrFailureFuture getAiringTvShows();
  TvShowDetailModelOrFailureFuture getTvShowDetail(int id);
  TvShowModelsOrFailureFuture searchTvShow(String query);
  TvShowModelsOrFailureFuture getTvShowRecommendations(int id);
}

class TVShowRemoteDataSourceImpl implements TVShowRemoteDataSource {
  static const apiKey = "2174d146bb9c0eab47529b2e77d6b526";
  final authority = 'api.themoviedb.org';
  final http.Client client;

  static const airingPath = '/3/tv/on_the_air';
  static const popularPath = '/3/tv/popular';
  static const topRatedPath = '/3/tv/top_rated';
  static const searchPath = '/3/search/tv';
  static const basePath = '/3/tv';

  TVShowRemoteDataSourceImpl(this.client);

  @override
  TvShowModelsOrFailureFuture getAiringTvShows() async {
    try {
      final res = await client
          .get(Uri.https(authority, airingPath, {'api_key': apiKey}));
      if (res.statusCode != 200) return const Left(ServerFailure());
      final json = jsonDecode(res.body);
      final tvShowListResponse = TVShowListResponse.fromJson(json);
      return Right(tvShowListResponse.results);
    } on SocketException {
      return const Left(ConnectionFailure());
    } on Exception {
      return const Left(ServerFailure());
    }
  }

  @override
  TvShowModelsOrFailureFuture getPopularTvShows() async {
    try {
      final res = await client
          .get(Uri.https(authority, popularPath, {'api_key': apiKey}));
      if (res.statusCode != 200) return const Left(ServerFailure());
      final json = jsonDecode(res.body);
      final tvShowListResponse = TVShowListResponse.fromJson(json);
      return Right(tvShowListResponse.results);
    } on SocketException {
      return const Left(ConnectionFailure());
    } on Exception {
      return const Left(ServerFailure());
    }
  }

  @override
  TvShowModelsOrFailureFuture getTopRatedTvShows() async {
    try {
      final res = await client
          .get(Uri.https(authority, topRatedPath, {'api_key': apiKey}));
      if (res.statusCode != 200) return const Left(ServerFailure());
      final json = jsonDecode(res.body);
      final tvShowListResponse = TVShowListResponse.fromJson(json);
      return Right(tvShowListResponse.results);
    } on SocketException {
      return const Left(ConnectionFailure());
    } on Exception {
      return const Left(ServerFailure());
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

      if (res.statusCode != 200) return const Left(ServerFailure());
      final json = jsonDecode(res.body);
      final tvShowDetail = TVShowDetailModel.fromJson(json);
      return Right(tvShowDetail);
    } on SocketException {
      return const Left(ConnectionFailure());
    } on Exception {
      return const Left(ServerFailure());
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

      if (res.statusCode != 200) return const Left(ServerFailure());

      final json = jsonDecode(res.body);
      final tvShowListResponse = TVShowListResponse.fromJson(json);
      return Right(tvShowListResponse.results);
    } on SocketException {
      return const Left(ConnectionFailure());
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
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
      if (res.statusCode != 200) return const Left(ServerFailure());
      final json = jsonDecode(res.body);
      final tvShowListResponse = TVShowListResponse.fromJson(json);
      return Right(tvShowListResponse.results);
    } on SocketException {
      return const Left(ConnectionFailure());
    } on Exception {
      return const Left(ServerFailure());
    }
  }
}