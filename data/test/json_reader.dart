import 'dart:io';

String readJson(String name) {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  if (dir.endsWith('/data')) {
    dir = dir.replaceAll('/data', '');
  }
  return File('$dir/data/test/$name').readAsStringSync();
}
