import 'dart:io';

import 'package:xcgrid_da/src/generated/common_data_types.pb.dart';
import 'package:xcgrid_da/src/preset/dummy.dart';

Future<void> main(List<String> arguments) async {
  DummyPresetKeys keys = presetKeys();

  var preset = DummyPreset(keys);
  var callMeta = preset.memoSetContentComp('hi').memoGetContent().toProto();
  print('result -> $callMeta');
  exit(0);
}

DummyPresetKeys presetKeys() {
  var keys = DummyPresetKeys(noteId: 'note_1', memoId: 'note_2');
  String tag='store:Demo';
  String owner='samlet';
  print('keys-proto: ${keys.asPlRequest(tag, owner)}');
  return keys;
}
