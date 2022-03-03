import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class TVShowTable extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;

  factory TVShowTable.fromMap(Map<String, dynamic> map) {
    return TVShowTable(
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

  TVShowTable({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
  });
  @override
  List<Object?> get props => [id, title, overview, posterPath];
}
