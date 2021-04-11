import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:dj/dj.dart';

import 'ios/ios.dart';

/// IO Warapper for BaseDJ from 'dj' library.
class BaseDjIo {
  final Map<String, dynamic> baseDjMap;

  BaseDjIo({
    required this.baseDjMap,
  });

  void write() {
    print('Writting to Disk...');
    var baseDj = BaseDj.fromJson(baseDjMap);

    var directoryDjIo = DirectoryDjIo(directoryDj: baseDj.node);
    directoryDjIo.create(baseDj.path);

    var dirPath = p.join(baseDj.path, directoryDjIo.directoryDj.name);
    print('Formatting $dirPath...');
    var result = Process.runSync('dart', ['format', dirPath]);
    print(result.stdout);
  }
}
