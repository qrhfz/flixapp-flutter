import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

extension GenreListExtension on List<Genre> {
  String asString() {
    final genreNameList = map((genre) => genre.name).toList();
    return genreNameList.join(', ');
  }
}
