import 'package:data/models/movie_table.dart';
import 'package:data/models/tv_show_detail_model.dart';
import 'package:data/models/tv_show_table.dart';

const testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

const testTvShowTable = TVShowTable(
  id: 1,
  title: 'title',
  overview: 'overview',
  posterPath: 'posterPath',
);

const testTvShowDetailModel = TVShowDetailModel(
  genres: [],
  id: 1399,
  numberOfEpisodes: 73,
  numberOfSeasons: 8,
  overview:
      "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
  popularity: 369.594,
  title: "Game of Thrones",
);
