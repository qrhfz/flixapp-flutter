// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowDetailModel _$TvShowDetailModelFromJson(Map<String, dynamic> json) =>
    TvShowDetailModel(
      id: json['id'] as int,
      numberOfEpisodes: json['number_of_episodes'] as int,
      numberOfSeasons: json['number_of_seasons'] as int,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String?,
      title: json['name'] as String,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TvShowDetailModelToJson(TvShowDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'genres': instance.genres,
      'number_of_episodes': instance.numberOfEpisodes,
      'number_of_seasons': instance.numberOfSeasons,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'name': instance.title,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
