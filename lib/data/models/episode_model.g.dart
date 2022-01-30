// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) => EpisodeModel(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String,
      stillPath: json['still_path'] as String?,
      seasonNumber: json['season_number'] as int,
      airDate: DateTime.parse(json['air_date'] as String),
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
      episodeNumber: json['episode_number'] as int,
    );

Map<String, dynamic> _$EpisodeModelToJson(EpisodeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'still_path': instance.stillPath,
      'season_number': instance.seasonNumber,
      'air_date': instance.airDate.toIso8601String(),
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'episode_number': instance.episodeNumber,
    };
