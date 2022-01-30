import 'package:ditonton/data/models/tv_show_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_show_list_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TvShowListResponse extends Equatable {
  final int page;
  final List<TvShowModel> results;

  TvShowListResponse({required this.page, required this.results});

  factory TvShowListResponse.fromJson(Map<String, dynamic> json) =>
      _$TvShowListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowListResponseToJson(this);

  @override
  List<Object?> get props => [page, results];
}
