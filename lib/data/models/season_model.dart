import 'package:ditonton/domain/entities/season.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'season_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SeasonModel extends Equatable {
  final int id;
  @JsonKey(name: 'name')
  final String title;
  final String overview;
  final String? posterPath;
  final int seasonNumber;
  final DateTime airDate;
  final int episodeCount;

  SeasonModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.airDate,
    required this.episodeCount,
  });

  factory SeasonModel.fromJson(Map<String, dynamic> json) =>
      _$SeasonModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonModelToJson(this);

  Season toEntity() => Season(
        id: id,
        title: overview,
        posterPath: posterPath,
        seasonNumber: seasonNumber,
        airDate: airDate,
        episodeCount: episodeCount,
        overview: overview,
      );

  @override
  List<Object?> get props =>
      [id, title, overview, posterPath, seasonNumber, airDate, episodeCount];
}
