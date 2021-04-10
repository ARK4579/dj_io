import 'package:path/path.dart' as p;

import 'package:dj_io/dj_io.dart';

void main() {
  var outputDir = p.join('lib');

  // Usnig 'dj' library to generate code structure
  var baseDj = BaseDj(
    path: outputDir,
    node: DirectoryDj(
      name: 'dj_generated',
      nodes: [
        FileDj(
          name: 'hello_world',
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

  // Generating Json for Auto-Generated code
  var baseDjMap = baseDj.toJson();

  print('Auto-Generated Code:');
  print(baseDjMap);

  // Using This librarie's BaseDjIo Writter to write generated code to disk.
  var baseDjIo = BaseDjIo(baseDjMap: baseDjMap);
  baseDjIo.write();
}
