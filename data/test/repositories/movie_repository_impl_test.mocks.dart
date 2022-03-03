// Mocks generated by Mockito 5.1.0 from annotations
// in data/test/repositories/movie_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:data/datasources/movie_local_data_source.dart' as _i6;
import 'package:data/datasources/movie_remote_data_source.dart' as _i3;
import 'package:data/models/movie_detail_model.dart' as _i2;
import 'package:data/models/movie_model.dart' as _i5;
import 'package:data/models/movie_table.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeMovieDetailResponse_0 extends _i1.Fake
    implements _i2.MovieDetailResponse {}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i3.MovieRemoteDataSource {
  MockMovieRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i5.MovieModel>> getNowPlayingMovies() => (super.noSuchMethod(
          Invocation.method(#getNowPlayingMovies, []),
          returnValue: Future<List<_i5.MovieModel>>.value(<_i5.MovieModel>[]))
      as _i4.Future<List<_i5.MovieModel>>);
  @override
  _i4.Future<List<_i5.MovieModel>> getPopularMovies() => (super.noSuchMethod(
          Invocation.method(#getPopularMovies, []),
          returnValue: Future<List<_i5.MovieModel>>.value(<_i5.MovieModel>[]))
      as _i4.Future<List<_i5.MovieModel>>);
  @override
  _i4.Future<List<_i5.MovieModel>> getTopRatedMovies() => (super.noSuchMethod(
          Invocation.method(#getTopRatedMovies, []),
          returnValue: Future<List<_i5.MovieModel>>.value(<_i5.MovieModel>[]))
      as _i4.Future<List<_i5.MovieModel>>);
  @override
  _i4.Future<_i2.MovieDetailResponse> getMovieDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
              returnValue: Future<_i2.MovieDetailResponse>.value(
                  _FakeMovieDetailResponse_0()))
          as _i4.Future<_i2.MovieDetailResponse>);
  @override
  _i4.Future<List<_i5.MovieModel>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
              returnValue:
                  Future<List<_i5.MovieModel>>.value(<_i5.MovieModel>[]))
          as _i4.Future<List<_i5.MovieModel>>);
  @override
  _i4.Future<List<_i5.MovieModel>> searchMovies(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
              returnValue:
                  Future<List<_i5.MovieModel>>.value(<_i5.MovieModel>[]))
          as _i4.Future<List<_i5.MovieModel>>);
}

/// A class which mocks [MovieLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieLocalDataSource extends _i1.Mock
    implements _i6.MovieLocalDataSource {
  MockMovieLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<String> insertWatchlist(_i7.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: Future<String>.value('')) as _i4.Future<String>);
  @override
  _i4.Future<String> removeWatchlist(_i7.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: Future<String>.value('')) as _i4.Future<String>);
  @override
  _i4.Future<_i7.MovieTable?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: Future<_i7.MovieTable?>.value())
          as _i4.Future<_i7.MovieTable?>);
  @override
  _i4.Future<List<_i7.MovieTable>> getWatchlistMovies() => (super.noSuchMethod(
          Invocation.method(#getWatchlistMovies, []),
          returnValue: Future<List<_i7.MovieTable>>.value(<_i7.MovieTable>[]))
      as _i4.Future<List<_i7.MovieTable>>);
}
