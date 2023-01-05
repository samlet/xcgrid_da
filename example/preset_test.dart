import 'dart:io';

import 'package:xcgrid_da/src/generated/common_data_types.pb.dart';
import 'package:xcgrid_da/src/preset/dummy.dart';

Future<void> main(List<String> arguments) async {

  var keys=DummyPresetKeys(noteId: 'note_1', memoId: 'note_2');

  var preset = DummyPreset(keys);
  var cnt=await preset.memoSetContent('hi')
    .memoGetContentCall();
  print('result -> $cnt');
  exit(0);
}

