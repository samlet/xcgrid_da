part of 'poster.dart';

extension PosterLoader on PresetDispatcherAgent {
  Future<PosterPreset> loadPosterPreset(StringValue plOr) async {
    var meta = await loadPresetMeta(plOr);
    var keys = PosterPresetKeys.fromMeta(meta);
    var preset = PosterPreset(keys, presetAgent: this);
    return preset;
  }
}


