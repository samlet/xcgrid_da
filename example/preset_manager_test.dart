import 'dart:io';

import 'package:xcgrid_da/src/agent/preset_manager.dart';
import 'package:xcgrid_da/src/preset/dummy.dart';
import 'package:xcgrid_da/xcrpc_api.dart';

Future<void> main(List<String> arguments) async {
  var regionId = 'default';
  var xc = XcClient();
  var pm = xc.presetManagerAgent();
  var idOr =
      await pm.getPlIdByOwnerAndTag(regionId, "samlet", "store:demoStore");
  print("id-or: $idOr");
  // assert(idOr.resultType == IdOrErr_ResultType.NOT_FOUND);

  BundleKey plKey;
  if(isNotFound(idOr)) {
    var plOr = await pm.createPresetPl(
        regionId, 'Dummy', 'samlet', "store:demoStore",
        StringMap()
          ..values.addAll({'noteId': 'note_1', 'memoId': 'note_2'}));
    plKey = BundleKey(regionId: regionId, id: plOr.value);
    print('create pl $plKey');
  }else{
    var plId=idOr.id;
    plKey = BundleKey(regionId: regionId, id: plId);
  }

  // call builders
  var keys=DummyPresetKeys(noteId: 'note_1', memoId: 'note_2');
  var preset = DummyPreset(keys, presetAgent: pm, plKey: plKey);
  var cnt=await preset.memoSetContent('hi')
      .memoGetContentCall();
  print('result -> ${cnt.value}');

  exit(0);
}

bool isNotFound(IdOrErr idOr) => idOr.resultType == IdOrErr_ResultType.NOT_FOUND;
