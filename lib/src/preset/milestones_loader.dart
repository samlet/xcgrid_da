// import '../agent/preset_manager.dart';
import '../agent/preset_dispatcher.dart';
import '../generated/google/protobuf/wrappers.pb.dart';
import 'milestones.dart';

extension MilestonesLoader on PresetDispatcherAgent {
  Future<MilestonesPreset> loadMilestonesPreset(StringValue plOr) async {
    var meta = await loadPresetMeta(plOr);
    var keys = MilestonesPresetKeys.fromMeta(meta);
    var preset = MilestonesPreset(keys, presetAgent: this);
    return preset;
  }
}


