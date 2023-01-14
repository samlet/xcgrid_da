import '../agent/preset_manager.dart';
import '../generated/google/protobuf/wrappers.pb.dart';
import 'dummy.dart';

extension DummyLoader on PresetManagerAgent {
  Future<DummyPreset> loadDummyPreset(StringValue plOr) async {
    var meta = await loadPresetMeta(plOr);
    var keys = DummyPresetKeys.fromMeta(meta);
    var preset = DummyPreset(keys, presetAgent: this);
    return preset;
  }
}


