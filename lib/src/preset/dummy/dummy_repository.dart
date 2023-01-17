part of 'dummy.dart';

class LoadDummyPresetKeysEvent extends PresetEvent {
  final DummyPresetKeys presetKeys;

  LoadDummyPresetKeysEvent(this.presetKeys);
}

class DummyRepository {
  final PresetDispatcherAgent presetAgent;
  DummyPreset? _preset;

  DummyRepository(this.presetAgent);

  final presetController = BehaviorSubject<PresetEvent>();

  Future<DummyPreset?> loadPreset(
      DummyPresetKeys presetKeys, String tag, String owner) async {
    if (_preset != null) return _preset;

    var requestKeys = presetKeys.asCallBuilderProto(tag, owner);
    var plOr = await presetAgent.client.createPresetPl(requestKeys);
    _preset = await presetAgent.loadDummyPreset(plOr);
    emit(LoadDummyPresetKeysEvent(_preset!.keys));
    return _preset;
  }

  void emit(PresetEvent e) {
    presetController.add(e);
  }
  void dispose() => presetController.close();
}


