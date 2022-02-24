import 'dart:convert';

import 'package:ditonton/data/models/tv_show_model.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final dummyTvJson = '''
      {
      "backdrop_path": "/oKt4J3TFjWirVwBqoHyIvv5IImd.jpg",
      "first_air_date": "2019-06-16",
      "genre_ids": [
        18
      ],
      "id": 85552,
      "name": "Euphoria",
      "origin_country": [
        "US"
      ],
      "original_language": "en",
      "original_name": "Euphoria",
      "overview": "A group of high school students navigate love and friendships in a world of drugs, sex, trauma, and social media.",
      "popularity": 4322.903,
      "poster_path": "/jtnfNzqZwN4E32FGGxx1YZaBWWf.jpg",
      "vote_average": 8.4,
      "vote_count": 5654
    }
      ''';

  final dummyTvModel = TvShowModel(
    backdropPath: "/oKt4J3TFjWirVwBqoHyIvv5IImd.jpg",
    genreIds: [18],
    id: 85552,
    title: 'Euphoria',
    overview:
        'A group of high school students navigate love and friendships in a world of drugs, sex, trauma, and social media.',
    popularity: 4322.903,
    posterPath: '/jtnfNzqZwN4E32FGGxx1YZaBWWf.jpg',
    voteAverage: 8.4,
    voteCount: 5654,
  );

  final dummyTv = TvShow(
    // backdropPath: "/oKt4J3TFjWirVwBqoHyIvv5IImd.jpg",
    // genreIds: [18],
    id: 85552,
    title: 'Euphoria',
    overview:
        'A group of high school students navigate love and friendships in a world of drugs, sex, trauma, and social media.',
    popularity: 4322.903,
    posterPath: '/jtnfNzqZwN4E32FGGxx1YZaBWWf.jpg',
    // voteAverage: 8.4,
    // voteCount: 5654,
  );

  group('tv model test', () {
    test('given json string return Tv object', () {
      final tvModel = TvShowModel.fromJson(jsonDecode(dummyTvJson));
      assert(dummyTvModel == tvModel);
    });

    test('given TvModel, toEntity returns Tv object', () {
      final tvModelResult = dummyTvModel.toEntity();
      assert(tvModelResult == dummyTv);
    });
  });
}
