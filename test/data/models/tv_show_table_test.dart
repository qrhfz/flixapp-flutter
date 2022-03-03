import 'package:ditonton/data/models/tv_show_table.dart';
import 'package:ditonton/domain/tv/entities/tv_show.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final testData = TVShowTable(
    id: 1,
    overview: 'overview',
    posterPath: 'posterPath',
    title: 'title',
  );
  final testMap = {
    'id': 1,
    'overview': 'overview',
    'posterPath': 'posterPath',
    'title': 'title',
  };

  group('tv show table', () {
    test('tv show table to map', () {
      final map = testData.toMap();
      assert(map['id'] == testMap['id']);
      assert(map['overview'] == testMap['overview']);
      assert(map['posterPath'] == testMap['posterPath']);
      assert(map['title'] == testMap['title']);
    });

    test('tv show table from map', () {
      final TVShowTable data = TVShowTable.fromMap(testMap);
      assert(data == testData);
    });

    test('tv show table to entity', () {
      final TVShow data = testData.toEntity();
      assert(data ==
          TVShow(
            id: 1,
            overview: 'overview',
            posterPath: 'posterPath',
            title: 'title',
          ));
    });
  });
}
