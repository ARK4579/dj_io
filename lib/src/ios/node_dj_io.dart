import 'dart:io';

abstract class NodeDjIo {
  void create(String basePath) {
    Directory(basePath).createSync(recursive: true);
  }
}
