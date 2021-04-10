import 'dart:io';

import 'package:dj/dj.dart';
import 'package:path/path.dart' as p;

import 'node_dj_io.dart';
import 'file_dj_io.dart';

class DirectoryDjIo extends NodeDjIo {
  final DirectoryDj directoryDj;
  DirectoryDjIo({
    required this.directoryDj,
  });

  @override
  void create(String basePath) {
    super.create(basePath);

    var dirPath = p.join(basePath, directoryDj.name);

    var directory = Directory(dirPath);

    directory.createSync();

    directoryDj.nodes?.forEach((node) {
      if (node.type == StructureType.Directory) {
        var nodeDirectoryDjIo =
            DirectoryDjIo(directoryDj: DirectoryDj.fromJson(node.toJson()));
        nodeDirectoryDjIo.create(dirPath);
      } else if (node.type == StructureType.File) {
        var nodeDirectoryDjIo =
            FileDjIo(fileDj: FileDj.fromJson(node.toJson()));
        nodeDirectoryDjIo.create(dirPath);
      } else {
        print('${node.runtimeType} Not Handeled');
      }
    });
  }
}
