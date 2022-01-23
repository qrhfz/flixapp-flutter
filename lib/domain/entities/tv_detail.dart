import 'package:ditonton/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';

import 'episode.dart';
import 'season.dart';

class TvDetail extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final DateTime? firstAirDate;
  final DateTime? lastAirDate;
  final List<Genre>? genres;
  final int id;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final List<Season> seasons;
  final Episode lastEpisodeToAir;

  TvDetail({
    required this.id,
    required this.adult,
    required this.backdropPath,
    required this.firstAirDate,
    required this.genres,
    required this.lastAirDate,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.seasons,
    required this.lastEpisodeToAir,
  });

  @override
  List<Object?> get props => [
        id,
        adult,
        backdropPath,
        firstAirDate,
        genres,
        lastAirDate,
        numberOfEpisodes,
        numberOfSeasons,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
        seasons,
        lastEpisodeToAir,
      ];
}
