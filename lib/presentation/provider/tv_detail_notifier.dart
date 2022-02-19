import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:ditonton/domain/usecases/tvshow/get_tv_show_detail.dart';
import 'package:ditonton/injection.dart';
import 'package:flutter/foundation.dart';

class TvDetailNotifier extends ChangeNotifier {
  RequestState state = RequestState.Empty;
  late TvShowDetail tv;
  String message = '';
  final GetTvShowDetail getDetail = locator.get();

  void fetchDetail(int id) async {
    state = RequestState.Loading;
    final result = await getDetail(id);

    result.fold((l) {
      state = RequestState.Error;
      message = l.message;
    }, (r) {
      state = RequestState.Loaded;
      return tv = r;
    });

    notifyListeners();
  }
}
