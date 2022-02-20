import 'package:flutter/widgets.dart';

import '../domain/entities/genre.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

extension GenreListExtension on List<Genre> {
  String asString() {
    final genreNameList = this.map((genre) => genre.name).toList();
    return genreNameList.join(', ');
  }
}
