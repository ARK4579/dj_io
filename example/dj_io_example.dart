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
              description: 'Main entry point to this file!',
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
        FileDj(
          name: 'simple_widget',
          codeParts: [
            ImportDj(importStr: 'package:flutter/material.dart'),
            StatelessWidgetDj(
              name: 'SimpleWidget',
              args: [
                FunctionArg(
                  type: VariableType.String,
                  isRequired: true,
                  name: 'msg',
                ),
              ],
              body: [
                FunctionCallDj(
                  name: 'print',
                  arg: "'Its True! 1 equals 2 now!'",
                ),
                ReturnDj(
                  returnStr: 'Container()',
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

  // Using This libraries BaseDjIo Writer to write generated code to disk.
  var baseDjIo = BaseDjIo(baseDjMap: baseDjMap);
  baseDjIo.write();
}
