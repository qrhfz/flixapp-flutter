import 'package:ditonton/data/models/tv_show_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_show_list_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TVShowListResponse extends Equatable {
  final int page;
  final List<TVShowModel> results;

  TVShowListResponse({required this.page, required this.results});

  factory TVShowListResponse.fromJson(Map<String, dynamic> json) =>
      _$TVShowListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TVShowListResponseToJson(this);

  @override
  List<Object?> get props => [page, results];
}
