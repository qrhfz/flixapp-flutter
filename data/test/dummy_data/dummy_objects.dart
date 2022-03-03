import 'package:domain/domain.dart';

const testTvShowDetail = TVShowDetail(
  id: 1,
  genres: [],
  overview: 'overview',
  popularity: 0,
  posterPath: 'posterPath',
  title: 'title',
  voteAverage: 0,
  voteCount: 0,
  numberOfEpisodes: 1,
  numberOfSeasons: 1,
);

const testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

const testTvShow = TVShow(
  id: 1,
  overview: 'overview',
  popularity: 0,
  posterPath: 'posterPath',
  title: 'title',
);
