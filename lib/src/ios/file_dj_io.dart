import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:dj/dj.dart';

import 'node_dj_io.dart';

class FileDjIo extends NodeDjIo {
  final FileDj fileDj;
  FileDjIo({
    required this.fileDj,
  });

  @override
  void create(String basePath) {
    super.create(basePath);

    var fileAbsolutePath =
        p.join(basePath, '${fileDj.name}.${fileDj.fileExtension}');

    var file = File(fileAbsolutePath);

    file.createSync();

    var fileWritter = file.openWrite();
    fileDj.codeParts?.forEach((codePart) {
      codePart.lines().forEach((codePartLine) {
        fileWritter.writeln(codePartLine);
      });
    });
    fileWritter.close();
  }
}
