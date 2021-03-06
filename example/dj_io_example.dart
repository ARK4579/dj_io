import 'package:dj/main/djs/code_djs/if_else.dart';
import 'package:path/path.dart' as p;

import 'package:dj_io/dj_io.dart';

void main() {
  var outputDir = p.join('lib');

  // Using 'dj' library to generate code structure
  var baseDj = BaseDj(
    path: outputDir,
    node: DirectoryDj(
      name: 'dj_generated',
      nodes: [
        FileDj(
          name: 'hello_world',
          codeParts: [
            ImportDj(importStr: 'simple_widget.dart'),
            FunctionDj(
              descriptionDj: 'Main entry point to this file!',
              outputType: VariableType.Void,
              name: 'main',
              bodyCodeParts: [
                FunctionCallDj(
                  name: 'print',
                  arg: "'Hello World!'",
                ),
                IfElseDj(
                  conditions: [
                    Condition(
                      conditionLeft: '1',
                      operator: Operator.Equal,
                      conditionRight: '2',
                      body: FunctionCallDj(
                        name: 'print',
                        arg: "'Its True! 1 equals 2 now!'",
                      ),
                    ),
                    Condition(
                      conditionLeft: '2',
                      operator: Operator.Equal,
                      conditionRight: '1',
                      body: FunctionCallDj(
                        name: 'print',
                        arg: "'Its True! 2 equals 1 now!'",
                      ),
                    ),
                    Condition(
                      body: FunctionCallDj(
                        name: 'print',
                        arg: "'Its False!'",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        // TODO Add ClassDj exmaple File
      ],
    ),
  );

  // Generating Json for Auto-Generated code
  var baseDjMap = baseDj.toJson();

  // Using This libraries BaseDjIo Writer to write generated code to disk.
  var baseDjIo = BaseDjIo(baseDjMap: baseDjMap);
  baseDjIo.write();
}
