part of 'poster.dart';

class LoadPosterPresetKeysEvent extends PresetEvent {
  final PosterPresetKeys presetKeys;

  LoadPosterPresetKeysEvent(this.presetKeys);
}

class PosterRepository {
  final PresetDispatcherAgent presetAgent;
  PosterPreset? _preset;

  PosterRepository(this.presetAgent);

  final presetController = BehaviorSubject<PresetEvent>();

  Future<PosterPreset?> loadPreset(
      PosterPresetKeys presetKeys, String tag, String owner) async {
    if (_preset != null) return _preset;

    var requestKeys = presetKeys.asCallBuilderProto(tag, owner);
    var plOr = await presetAgent.client.createPresetPl(requestKeys);
    _preset = await presetAgent.loadPosterPreset(plOr);
    emit(LoadPosterPresetKeysEvent(_preset!.keys));
    return _preset;
  }

  void emit(PresetEvent e) {
    presetController.add(e);
  }
  void dispose() => presetController.close();
}


