import 'dart:io';
import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' as p;

import 'package:dj/dj.dart';

import 'node_dj_io.dart';

class FileDjIo extends NodeDjIo {
  final FileDj fileDj;
  final bool shouldFormat;

  FileDjIo({
    required this.fileDj,
    this.shouldFormat = true,
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
      var codeLines = <String>[];

      fileDj.codeParts?.forEach((codePart) {
        codePart.toCode().forEach((codePartLine) {
          codeLines.add(codePartLine);
        });
      });

      var singleCodeLine = codeLines.join('\n');

      if (shouldFormat) {
        singleCodeLine = DartFormatter().format(singleCodeLine);
      }

      var fileWriter = _handler!.openWrite();
      fileWriter.writeln(singleCodeLine);
      fileWriter.close();
    }
  }
}
