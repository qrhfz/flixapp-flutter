// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvModel _$TvModelFromJson(Map<String, dynamic> json) => TvModel(
      id: json['id'] as int,
      backdropPath: json['backdrop_path'] as String?,
      firstAirDate: DateTime.parse(json['first_air_date'] as String),
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String?,
      title: json['name'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );

Map<String, dynamic> _$TvModelToJson(TvModel instance) => <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'first_air_date': instance.firstAirDate.toIso8601String(),
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'name': instance.title,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
