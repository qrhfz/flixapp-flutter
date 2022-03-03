// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TVShowModel _$TVShowModelFromJson(Map<String, dynamic> json) => TVShowModel(
      id: json['id'] as int,
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      title: json['name'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );

Map<String, dynamic> _$TVShowModelToJson(TVShowModel instance) =>
    <String, dynamic>{
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'name': instance.title,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
