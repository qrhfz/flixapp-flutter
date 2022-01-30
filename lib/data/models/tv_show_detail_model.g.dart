// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowDetailModel _$TvShowDetailModelFromJson(Map<String, dynamic> json) =>
    TvShowDetailModel(
      id: json['id'] as int,
      backdropPath: json['backdrop_path'] as String?,
      firstAirDate: DateTime.parse(json['first_air_date'] as String),
      lastAirDate: DateTime.parse(json['last_air_date'] as String),
      numberOfEpisodes: json['number_of_episodes'] as int,
      numberOfSeasons: json['number_of_seasons'] as int,
      originalTitle: json['original_name'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String?,
      title: json['name'] as String,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      seasons: (json['seasons'] as List<dynamic>?)
          ?.map((e) => SeasonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastEpisodeToAir: json['last_episode_to_air'] == null
          ? null
          : EpisodeModel.fromJson(
              json['last_episode_to_air'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TvShowDetailModelToJson(TvShowDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backdrop_path': instance.backdropPath,
      'first_air_date': instance.firstAirDate.toIso8601String(),
      'last_air_date': instance.lastAirDate.toIso8601String(),
      'genres': instance.genres,
      'number_of_episodes': instance.numberOfEpisodes,
      'number_of_seasons': instance.numberOfSeasons,
      'original_name': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'name': instance.title,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'seasons': instance.seasons,
      'last_episode_to_air': instance.lastEpisodeToAir,
    };
