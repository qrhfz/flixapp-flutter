import 'package:domain/common/entities/genre.dart';
import 'package:domain/movie/entities/movie.dart';
import 'package:domain/movie/entities/movie_detail.dart';
import 'package:domain/tv/entities/tv_show.dart';
import 'package:domain/tv/entities/tv_show_detail.dart';

const testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testMovieList = [testMovie];

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
