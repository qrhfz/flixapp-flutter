import 'dart:convert';
import 'dart:io';
import 'package:domain/domain.dart';
import 'package:http/io_client.dart';

import '../models/movie_detail_model.dart';
import '../models/movie_model.dart';
import '../models/movie_response.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailResponse> getMovieDetail(int id);
  Future<List<MovieModel>> getMovieRecommendations(int id);
  Future<List<MovieModel>> searchMovies(String query);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  static const apiKey = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const baseURL = 'https://api.themoviedb.org/3';

  IOClient? _ioClient;
  late Future<SecurityContext> Function() _getContext;

  Future<IOClient> get ioClient async {
    if (_ioClient != null) return _ioClient!;

    final client = HttpClient(context: await _getContext())
      ..badCertificateCallback = (cert, host, port) => false;

    return IOClient(client);
  }

  ///if IOClient is provided getContext is not required
  MovieRemoteDataSourceImpl({
    IOClient? ioClient,
    Future<SecurityContext> Function()? getContext,
  }) {
    if (ioClient != null) {
      _ioClient = ioClient;
      return;
    } else if (getContext != null) {
      _getContext = getContext;
    } else {
      throw Exception('both ioClient and getContext is null');
    }
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final client = await ioClient;
    final response = await client.get(
      Uri.parse('$baseURL/movie/now_playing?$apiKey'),
    );

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieDetailResponse> getMovieDetail(int id) async {
    final client = await ioClient;
    final response = await client.get(Uri.parse('$baseURL/movie/$id?$apiKey'));

    if (response.statusCode == 200) {
      return MovieDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getMovieRecommendations(int id) async {
    final client = await ioClient;
    final response = await client.get(
      Uri.parse('$baseURL/movie/$id/recommendations?$apiKey'),
    );

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final client = await ioClient;
    final response = await client.get(
      Uri.parse('$baseURL/movie/popular?$apiKey'),
    );

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final client = await ioClient;
    final response = await client.get(
      Uri.parse('$baseURL/movie/top_rated?$apiKey'),
    );

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final client = await ioClient;
    final response = await client.get(
      Uri.parse('$baseURL/search/movie?$apiKey&query=$query'),
    );

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).movieList;
    } else {
      throw ServerException();
    }
  }
}
