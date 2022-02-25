import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:equatable/equatable.dart';

class TvShowTable extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;

  factory TvShowTable.fromMap(Map<String, dynamic> map) {
    return TvShowTable(
      id: map['id'],
      overview: map['overview'],
      posterPath: map['posterPath'],
      title: map['title'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'overview': overview,
      'posterPath': posterPath,
      'title': title,
    };
  }

  TVShow toEntity() =>
      TVShow(id: id, title: title, overview: overview, posterPath: posterPath);

  TvShowTable({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
  });
  @override
  List<Object?> get props => [id, title, overview, posterPath];
}
