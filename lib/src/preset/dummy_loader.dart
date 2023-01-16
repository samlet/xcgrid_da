// import '../agent/preset_manager.dart';
import '../agent/preset_dispatcher.dart';
import '../generated/google/protobuf/wrappers.pb.dart';
import 'dummy.dart';

extension DummyLoader on PresetDispatcherAgent {
  Future<DummyPreset> loadDummyPreset(StringValue plOr) async {
    var meta = await loadPresetMeta(plOr);
    var keys = DummyPresetKeys.fromMeta(meta);
    var preset = DummyPreset(keys, presetAgent: this);
    return preset;
  }
}


