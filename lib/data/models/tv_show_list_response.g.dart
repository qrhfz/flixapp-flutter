// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TVShowListResponse _$TVShowListResponseFromJson(Map<String, dynamic> json) =>
    TVShowListResponse(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => TVShowModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TVShowListResponseToJson(TVShowListResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
