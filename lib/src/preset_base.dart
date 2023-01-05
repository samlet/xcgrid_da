import 'package:protobuf/protobuf.dart';

import '../../common_proto.dart';
import 'agent/preset_manager.dart';
import 'generated/call_builder.pb.dart';
import 'util.dart';

enum BuilderState { bsCall, bsSaga }

class PresetBase {
  final List<CallProto> calls = [];
  final List<CallProto> sagas = [];

  int callNumber = 1;
  String? _name;

  String get name {
    return _name ??= slugId();
  }

  BuilderState currentState = BuilderState.bsCall;
  final PresetManagerAgent presetAgent;
  final BundleKey plKey;

  PresetBase(this.presetAgent, this.plKey);

  void incCallNumber() {
    callNumber++;
  }

  String callName(String name) {
    return "${name}_${callNumber}";
  }

  CallBuilderProto toProto() {
    return CallBuilderProto()
      ..name = name
      ..calls.addAll(calls)
      ..sagas.addAll(sagas);
  }

  void pushCall(String callNamePrefix, String dispCo, BundleKey key,
      GeneratedMessage callMsg) {
    var call = CallProto()
      ..callName = callName(callNamePrefix)
      ..dispCo = dispCo
      ..key = key
      ..callMsg = callMsg.writeToBuffer();
    switch (currentState) {
      case BuilderState.bsCall:
        calls.add(call);
        break;
      case BuilderState.bsSaga:
        sagas.add(call);
        break;
    }

    incCallNumber();
  }
}
