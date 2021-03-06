import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:data/datasources/tv_remote_data_source.dart';
import 'package:data/models/tv_show_detail_model.dart';
import 'package:data/models/tv_show_model.dart';
import 'package:domain/domain.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:mockito/mockito.dart';
import 'package:path/path.dart' as path;

import 'movie_remote_data_source_test.mocks.dart';

void main() {
  final IOClient ioClient = MockIOClient();
  final dataSource = TVShowRemoteDataSourceImpl(ioClient: ioClient);
  const authority = 'api.themoviedb.org';
  const tvShowListJsonString = ''' 
    {
        "page": 1,
        "results": [
            {
                "backdrop_path": "/7q448EVOnuE3gVAx24krzO7SNXM.jpg",
                "first_air_date": "2021-09-03",
                "genre_ids": [
                    10764
                ],
                "id": 130392,
                "name": "The D'Amelio Show",
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "The D'Amelio Show",
                "overview": "From relative obscurity and a seemingly normal life, to overnight success and thrust into the Hollywood limelight overnight, the D’Amelios are faced with new challenges and opportunities they could not have imagined.",
                "popularity": 25.211,
                "poster_path": "/z0iCS5Znx7TeRwlYSd4c01Z0lFx.jpg",
                "vote_average": 9.4,
                "vote_count": 2620
            }
        ]
    }
  ''';
  const tvShowDetailJsonString = '''
  {
    "backdrop_path": "/suopoADq0k8YZr4dQXcU6pToj6s.jpg",
    "first_air_date": "2011-04-17",
    "genres": [
      {
        "id": 10765,
        "name": "Sci-Fi & Fantasy"
      },
      {
        "id": 18,
        "name": "Drama"
      },
      {
        "id": 10759,
        "name": "Action & Adventure"
      },
      {
        "id": 9648,
        "name": "Mystery"
      }
    ],
    "id": 1399,
    "last_air_date": "2019-05-19",
    "last_episode_to_air": {
      "air_date": "2019-05-19",
      "episode_number": 6,
      "id": 1551830,
      "name": "The Iron Throne",
      "overview": "In the aftermath of the devastating attack on King's Landing, Daenerys must face the survivors.",
      "production_code": "806",
      "season_number": 8,
      "still_path": "/3x8tJon5jXFa1ziAM93hPKNyW7i.jpg",
      "vote_average": 4.8,
      "vote_count": 106
    },
    "name": "Game of Thrones",
    "next_episode_to_air": null,
    "number_of_episodes": 73,
    "number_of_seasons": 8,
    "original_language": "en",
    "original_name": "Game of Thrones",
    "overview": "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
    "popularity": 369.594,
    "poster_path": "/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg",
    "seasons": [
      {
        "air_date": "2010-12-05",
        "episode_count": 64,
        "id": 3627,
        "name": "Specials",
        "overview": "",
        "poster_path": "/kMTcwNRfFKCZ0O2OaBZS0nZ2AIe.jpg",
        "season_number": 0
      }
    ],
    "status": "Ended",
    "tagline": "Winter Is Coming",
    "type": "Scripted",
    "vote_average": 8.3,
    "vote_count": 11504
  }
  ''';

  group('tv remote data source', () {
    test('getAiringTvShows should return list of TvShowModels', () async {
      when(
        ioClient.get(Uri.https(authority, TVShowRemoteDataSourceImpl.airingPath,
            {'api_key': TVShowRemoteDataSourceImpl.apiKey})),
      ).thenAnswer(
        (_) async => Response(
          tvShowListJsonString,
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          },
        ),
      );

      final res = await dataSource.getAiringTvShows();
      assert(res is Right<Failure, List<TVShowModel>>);
    });

    test('getPopularTvShows should return list of TvShowModels', () async {
      when(
        ioClient.get(Uri.https(
            authority,
            TVShowRemoteDataSourceImpl.popularPath,
            {'api_key': TVShowRemoteDataSourceImpl.apiKey})),
      ).thenAnswer(
        (_) async => Response(
          tvShowListJsonString,
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          },
        ),
      );
      final res = await dataSource.getPopularTvShows();
      assert(res is Right<Failure, List<TVShowModel>>);
    });

    test('getTopRatedTvShows should return list of TvShowModels', () async {
      when(
        ioClient.get(Uri.https(
            authority,
            TVShowRemoteDataSourceImpl.topRatedPath,
            {'api_key': TVShowRemoteDataSourceImpl.apiKey})),
      ).thenAnswer(
        (_) async => Response(
          tvShowListJsonString,
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          },
        ),
      );
      final res = await dataSource.getTopRatedTvShows();
      assert(res is Right<Failure, List<TVShowModel>>);
    });

    test('getTvShowDetail should return TvShowDetailModel', () async {
      const id = 1399;
      when(
        ioClient.get(
          Uri.https(
            authority,
            path.join(TVShowRemoteDataSourceImpl.basePath, id.toString()),
            {'api_key': TVShowRemoteDataSourceImpl.apiKey},
          ),
        ),
      ).thenAnswer(
        (_) async => Response(
          tvShowDetailJsonString,
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          },
        ),
      );
      final res = await dataSource.getTvShowDetail(1399);
      final tvShowDetail = res.getOrElse(() {
        throw AssertionError();
      });
      assert(tvShowDetail ==
          TVShowDetailModel.fromJson(jsonDecode(tvShowDetailJsonString)));
    });

    test('searching tv show should return list of TvShowModels', () async {
      when(
        ioClient.get(Uri.https(authority, TVShowRemoteDataSourceImpl.searchPath,
            {'api_key': TVShowRemoteDataSourceImpl.apiKey, 'query': 'show'})),
      ).thenAnswer(
        (_) async => Response(
          tvShowListJsonString,
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          },
        ),
      );
      final res = await dataSource.searchTvShow('show');
      assert(res is Right<Failure, List<TVShowModel>>);
    });

    test('tv recommendations show should return list of TvShowModels',
        () async {
      const id = 1;
      when(
        ioClient.get(
          Uri.https(
            authority,
            path.join(TVShowRemoteDataSourceImpl.basePath, id.toString(),
                'recommendations'),
            {'api_key': TVShowRemoteDataSourceImpl.apiKey},
          ),
        ),
      ).thenAnswer(
        (_) async => Response(
          tvShowListJsonString,
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          },
        ),
      );
      final res = await dataSource.getTvShowRecommendations(id);
      assert(res is Right<Failure, List<TVShowModel>>);
    });
  });
}
