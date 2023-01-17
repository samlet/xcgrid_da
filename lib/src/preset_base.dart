import 'package:protobuf/protobuf.dart';

import '../../common_proto.dart';
import 'agent/preset_dispatcher.dart';
import 'generated/call_builder.pb.dart';
import 'generated/extra/common_slot.pb.dart';
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

  final PresetDispatcherAgent presetAgent;
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
      GeneratedMessage callMsg, int domainFieldNumber) {
    var call = CallProto()
      ..callName = callName(callNamePrefix)
      ..dispCo = dispCo
      ..key = key
      ..domainFieldNumber = domainFieldNumber
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

  Future<SlotList> dispatch() async {
    var result= await presetAgent.dispatch(plKey.id, toProto());
    reset();
    return result;
  }

  void reset(){
    currentState = BuilderState.bsCall;
    callNumber = 1;
    calls.clear();
    sagas.clear();
  }
}

