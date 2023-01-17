part of 'milestones.dart';

class LoadMilestonesPresetKeysEvent extends PresetEvent {
  final MilestonesPresetKeys presetKeys;

  LoadMilestonesPresetKeysEvent(this.presetKeys);
}

class MilestonesRepository {
  final PresetDispatcherAgent presetAgent;
  MilestonesPreset? _preset;

  MilestonesRepository(this.presetAgent);

  final presetController = BehaviorSubject<PresetEvent>();

  Future<MilestonesPreset?> loadPreset(
      MilestonesPresetKeys presetKeys, String tag, String owner) async {
    if (_preset != null) return _preset;

    var requestKeys = presetKeys.asCallBuilderProto(tag, owner);
    var plOr = await presetAgent.client.createPresetPl(requestKeys);
    _preset = await presetAgent.loadMilestonesPreset(plOr);
    emit(LoadMilestonesPresetKeysEvent(_preset!.keys));
    return _preset;
  }

  void emit(PresetEvent e) {
    presetController.add(e);
  }
  void dispose() => presetController.close();
}


