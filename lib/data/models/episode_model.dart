import 'package:ditonton/domain/entities/episode.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'episode_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EpisodeModel extends Equatable {
  final int id;
  @JsonKey(name: 'name')
  final String title;
  final String overview;
  final String? stillPath;
  final int seasonNumber;
  final DateTime airDate;
  final double voteAverage;
  final int voteCount;
  final int episodeNumber;

  EpisodeModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.stillPath,
    required this.seasonNumber,
    required this.airDate,
    required this.voteAverage,
    required this.voteCount,
    required this.episodeNumber,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);

  Episode toEntity() => Episode(
        id: id,
        airDate: airDate,
        episodeNumber: episodeNumber,
        overview: overview,
        seasonNumber: seasonNumber,
        stillPath: stillPath,
        title: title,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        stillPath,
        seasonNumber,
        airDate,
        voteAverage,
        voteCount,
        episodeNumber,
      ];
}
