import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:dj/dj.dart';

import 'node_dj_io.dart';

class FileDjIo extends NodeDjIo {
  final FileDj fileDj;
  FileDjIo({
    required this.fileDj,
  });

  File? _handler;

  @override
  void create(String basePath) {
    if (_handler == null) {
      super.create(basePath);

      var fullFileName = '${fileDj.name}.${fileDj.fileExtension}';
      var fileAbsolutePath = p.join(basePath, fullFileName);

      _handler = File(fileAbsolutePath);
    }

    _handler!.createSync();

    print('Created ${_handler?.absolute.path.toString()}');
  }

  @override
  void write() {
    if (_handler != null) {
      var fileWritter = _handler!.openWrite();
      fileDj.codeParts?.forEach((codePart) {
        codePart.lines().forEach((codePartLine) {
          fileWritter.writeln(codePartLine);
        });
      });
      fileWritter.close();
    }
    print('Wrote ${_handler?.absolute.path.toString()}');
  }
}
