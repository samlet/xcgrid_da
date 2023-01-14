import '../agent/preset_manager.dart';
import '../generated/google/protobuf/wrappers.pb.dart';
import 'poster.dart';

extension PosterLoader on PresetManagerAgent {
  Future<PosterPreset> loadPosterPreset(StringValue plOr) async {
    var meta = await loadPresetMeta(plOr);
    var keys = PosterPresetKeys.fromMeta(meta);
    var preset = PosterPreset(keys, presetAgent: this);
    return preset;
  }
}


