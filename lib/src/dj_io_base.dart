import 'package:dj/dj.dart';

import 'ios/ios.dart';

/// IO Wrapper for BaseDJ from 'dj' library.
class BaseDjIo {
  final Map<String, dynamic> baseDjMap;

  BaseDjIo({
    required this.baseDjMap,
  });

  void write() {
    print('Writing to Disk...');
    var baseDj = BaseDj.fromJson(baseDjMap);

    var directoryDjIo = DirectoryDjIo(directoryDj: baseDj.node);
    directoryDjIo.create(baseDj.path);
  }
}
