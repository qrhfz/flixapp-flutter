import 'package:ditonton/data/models/episode_model.dart';
import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/data/models/season_model.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_show_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TvShowDetailModel extends Equatable {
  final int id;
  final String? backdropPath;
  final DateTime firstAirDate;
  final DateTime lastAirDate;
  final List<GenreModel> genres;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String releaseDate;
  @JsonKey(name: 'title')
  final String title;
  final double? voteAverage;
  final int? voteCount;
  final List<SeasonModel>? seasons;
  final EpisodeModel? lastEpisodeToAir;

  TvShowDetailModel({
    required this.id,
    this.backdropPath,
    required this.firstAirDate,
    required this.lastAirDate,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.releaseDate,
    required this.title,
    this.voteAverage,
    this.voteCount,
    required this.genres,
    this.seasons,
    this.lastEpisodeToAir,
  });

  TvShowDetail toEntity() => TvShowDetail(
        id: id,
        backdropPath: backdropPath,
        firstAirDate: firstAirDate,
        genres: genres.map((e) => e.toEntity()).toList(),
        lastAirDate: lastAirDate,
        lastEpisodeToAir: lastEpisodeToAir?.toEntity(),
        numberOfEpisodes: numberOfEpisodes,
        numberOfSeasons: numberOfSeasons,
        originalTitle: '',
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        releaseDate: releaseDate,
        seasons: seasons?.map((e) => e.toEntity()).toList(),
        title: title,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        firstAirDate,
        lastAirDate,
        numberOfEpisodes,
        numberOfSeasons,
        originalTitle,
        title,
        overview,
        popularity,
        posterPath,
        releaseDate,
        voteAverage,
        voteCount,
      ];
}
