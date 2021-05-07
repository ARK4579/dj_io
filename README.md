Write and Format Auto-Generated dart/flutter code to disk while retaining manual user updates.

## Usage

A simple usage example:

```dart
import 'package:dj/main/djs/code_djs/if_else.dart';
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
```

You can run this example using following command:

`flutter pub run .\example\dj_io_example.dart;`

This will generated code in _lib\dj_generated_ directory.

If generated code is not formatted you can run following command to format it:

`dart format .\lib\dj_generated\`

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/ARK4579/dj_io/issues
