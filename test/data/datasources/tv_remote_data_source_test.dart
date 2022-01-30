import 'package:ditonton/data/datasources/tv_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_helper.mocks.dart';

/// https://api.themoviedb.org/3/tv/popular
/// https://api.themoviedb.org/3/tv/{id}
/// https://api.themoviedb.org/3/tv/on_the_air
/// https://api.themoviedb.org/3/tv/top_rated
/// https://api.themoviedb.org/3/search/tv{query}
///
void main(List<String> args) {
  final client = MockHttpClient();
  final TvRemoteDataSource dataSource = TvRemoteDataSourceImpl(client);

  group('tv remote data source', () {});
}
