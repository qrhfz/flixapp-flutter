import 'package:ditonton/data/models/tv_show_table.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final testData = TvShowTable(
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
      final TvShowTable data = TvShowTable.fromMap(testMap);
      assert(data == testData);
    });
  });
}
