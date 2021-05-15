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
  }

  @override
  void write() {
    if (_handler != null) {
      var fileWriter = _handler!.openWrite();
      fileDj.codeParts?.forEach((codePart) {
        codePart.toCode().forEach((codePartLine) {
          fileWriter.writeln(codePartLine);
        });
      });
      fileWriter.close();
    }
  }
}
