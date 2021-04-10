import 'package:dj_io/dj_io.dart';

void main() {
  var outputDir = '..\\lib';

  // Usnig 'dj' library to generate code structure
  var baseDj = BaseDj(
    baseDirectoryPath: outputDir,
    baseNode: DirectoryDj(
      directoryName: 'dj_generated',
      nodes: [
        FileDj(
          fileName: 'hello_world',
          codeParts: [
            // This import is really not needed in generated file
            // Adding this line for demonstration only!
            ImportDj(importStr: 'package:io/io.dart'),
            FunctionDj(
              description: 'Main entry point to this file!',
              outputType: VariableType.Void,
              name: 'main',
              bodyCodeParts: [
                FunctionCallDj(
                  name: 'print',
                  args: ["'Hellow World!'"],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );

  print('Auto-Generated Code:');
  print(baseDj.toJson());

  // Using This librarie's BaseDjIo Writter to write generated code to disk.
  var baseDjIo = BaseDjIo(baseDj: baseDj);
  baseDjIo.write();
}
