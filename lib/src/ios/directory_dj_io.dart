import 'dart:io';

import 'package:dj/dj.dart';
import 'package:path/path.dart' as p;

import 'node_dj_io.dart';
import 'file_dj_io.dart';

class DirectoryDjIo extends NodeDjIo {
  final DirectoryDj directoryDj;
  final bool shouldFormat;

  DirectoryDjIo({
    required this.directoryDj,
    this.shouldFormat = true,
  });

  @override
  void create(String basePath) {
    super.create(basePath);

    var dirPath = p.join(basePath, directoryDj.name);

    var directory = Directory(dirPath);

    directory.createSync();

    directoryDj.nodes?.forEach((node) {
      var nodeDjIo = getNodeDj(node, shouldFormat);
      if (nodeDjIo != null) {
        nodeDjIo.create(dirPath);
        nodeDjIo.write();
      }
    });
  }
}

NodeDjIo? getNodeDj(NodeDj? node, bool shouldFormat) {
  if (node == null) return null;

  NodeDjIo? nodeDjIo;
  if (node.type == StructureType.Directory) {
    nodeDjIo = DirectoryDjIo(
      directoryDj: DirectoryDj.fromJson(node.toJson()),
      shouldFormat: shouldFormat,
    );
  } else if (node.type == StructureType.File) {
    nodeDjIo = FileDjIo(
      fileDj: FileDj.fromJson(node.toJson()),
      shouldFormat: shouldFormat,
    );
  } else {
    print('${node.runtimeType} Not Handeled');
  }

  return nodeDjIo;
}
