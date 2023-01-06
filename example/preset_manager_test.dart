import 'dart:io';
import 'package:logging/logging.dart';

import 'package:xcgrid_da/src/agent/preset_manager.dart';
import 'package:xcgrid_da/src/preset/dummy.dart';
import 'package:xcgrid_da/xcrpc_api.dart';

final _log = Logger('presetManagerMain');

Future<void> main(List<String> arguments) async {
  initLogger();

  var regionId = 'default';
  var xc = XcClient();
  var pm = xc.presetManagerAgent();
  var idOr =
      await pm.getPlIdByOwnerAndTag(regionId, "samlet", "store:demoStore");
  _log.info("id-or: $idOr");
  // assert(idOr.resultType == IdOrErr_ResultType.NOT_FOUND);

  BundleKey plKey;

  if (isNotFound(idOr)) {
    var keysMap = {'noteId': 'note_1', 'memoId': 'note_2'};
    var plOr = await pm.createPresetPl(regionId, 'Dummy', 'samlet',
        "store:demoStore", StringMap()..values.addAll(keysMap));
    plKey = BundleKey(regionId: regionId, id: plOr.value);
    _log.info('create pl $plKey');
  } else {
    var plId = idOr.id;
    plKey = BundleKey(regionId: regionId, id: plId);
  }

  // call builders
  // var keys=DummyPresetKeys(noteId: 'note_1', memoId: 'note_2');
  var meta = await pm.loadPresetMeta(plKey.fullIdVal);
  print("meta: $meta");
  // var keys=DummyPresetKeys.fromMap(keysMap);
  var keys = DummyPresetKeys.fromMeta(meta);
  // var preset = DummyPreset(keys, presetAgent: pm, plKey: plKey);
  var preset = DummyPreset(keys, presetAgent: pm);
  var cnt = await preset.memoSetContent('hi').memoGetContentCall();
  print('result -> ${cnt.value}');

  exit(0);
}
