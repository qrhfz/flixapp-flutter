import 'dart:convert';

import 'package:data/models/tv_show_model.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const dummyTvJson = '''
      {
      "genre_ids": [
        18
      ],
      "id": 85552,
      "name": "Euphoria",
      "overview": "A group of high school students navigate love and friendships in a world of drugs, sex, trauma, and social media.",
      "popularity": 4322.903,
      "poster_path": "/jtnfNzqZwN4E32FGGxx1YZaBWWf.jpg",
      "vote_average": 8.4,
      "vote_count": 5654
    }
      ''';

  const dummyTvModel = TVShowModel(
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

  const dummyTv = TVShow(
    id: 85552,
    title: 'Euphoria',
    overview:
        'A group of high school students navigate love and friendships in a world of drugs, sex, trauma, and social media.',
    popularity: 4322.903,
    posterPath: '/jtnfNzqZwN4E32FGGxx1YZaBWWf.jpg',
  );

  group('tv model test', () {
    test('given json object return TVShow object', () {
      final tvModel = TVShowModel.fromJson(jsonDecode(dummyTvJson));
      assert(dummyTvModel == tvModel);
    });

    test('given TVShow object return json object', () {
      final json = dummyTvModel.toJson();
      expect(json, jsonDecode(dummyTvJson));
    });

    test('given TVModel, toEntity returns TVShow object', () {
      final tvModelResult = dummyTvModel.toEntity();
      assert(tvModelResult == dummyTv);
    });
  });
}
