// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowListResponse _$TvShowListResponseFromJson(Map<String, dynamic> json) =>
    TvShowListResponse(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => TvShowModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TvShowListResponseToJson(TvShowListResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
