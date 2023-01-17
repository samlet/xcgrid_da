import 'package:bloc/bloc.dart';
import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:xcgrid_da/common_proto.dart';
import 'agent/preset_dispatcher.dart';
import 'proto_types.dart';

import 'generated/extra/common_slot.pb.dart';
import 'preset_base.dart';

abstract class PresetEvent {
  const PresetEvent();
}

class AffectsEvent extends PresetEvent{
  final SlotsWrapper slots;

  AffectsEvent(this.slots);
}

abstract class PresetCubit<State> extends Cubit<State>{
  final PresetDispatcherAgent _presetAgent;
  PresetDispatcherAgent get presetAgent => _presetAgent;

  PresetCubit(super.initialState, this._presetAgent);
  PresetBase? get preset;
}

class SlotsWrapper extends Equatable{
  final SlotList slots;
  final Map<int, List<int>> _values;
  Map<int, List<int>> get values => _values;

  SlotsWrapper(this.slots): _values=buildValues(slots);

  static Map<int, List<int>> buildValues(SlotList slots) {
    Map<int, List<int>> fldsMapper = {};
    slots.values.where((element) => element.slotSeq != 0).forEach((element) {
      fldsMapper[element.slotSeq] = element.slotData;
    });
    return fldsMapper;
  }

  String? asString(int fldNumber) {
    if (values.containsKey(fldNumber)) {
      return StringValue.fromBuffer(values[fldNumber]!).value;
    }
    return null;
  }

  List<int>? asBytes(int fldNumber) {
    if (values.containsKey(fldNumber)) {
      return BytesValue.fromBuffer(values[fldNumber]!).value;
    }
    return null;
  }

  int? asInt(int fldNumber) {
    if (values.containsKey(fldNumber)) {
      return Int32Value.fromBuffer(values[fldNumber]!).value;
    }
    return null;
  }

  int? asLong(int fldNumber) {
    if (values.containsKey(fldNumber)) {
      return Int64Value.fromBuffer(values[fldNumber]!).value.toInt();
    }
    return null;
  }

  double? asDouble(int fldNumber) {
    if (values.containsKey(fldNumber)) {
      return DoubleValue.fromBuffer(values[fldNumber]!).value;
    }
    return null;
  }

  bool? asBool(int fldNumber) {
    if (values.containsKey(fldNumber)) {
      return BoolValue.fromBuffer(values[fldNumber]!).value;
    }
    return null;
  }

  BuffersData? asBuffers(int fldNumber) {
    if (values.containsKey(fldNumber)) {
      return BuffersData.fromBuffer(values[fldNumber]!);
    }
    return null;
  }

  Date? asDate(int fldNumber) {
    if (values.containsKey(fldNumber)) {
      return Date.fromBuffer(values[fldNumber]!);
    }
    return null;
  }

  TimeOfDay? asTime(int fldNumber) {
    if (values.containsKey(fldNumber)) {
      return TimeOfDay.fromBuffer(values[fldNumber]!);
    }
    return null;
  }

  StructData? asStruct(int fldNumber) {
    if (values.containsKey(fldNumber)) {
      return StructData.fromBuffer(values[fldNumber]!);
    }
    return null;
  }

  ValueData? asValue(int fldNumber) {
    if (values.containsKey(fldNumber)) {
      return ValueData.fromBuffer(values[fldNumber]!);
    }
    return null;
  }

  DateTime? asDateTime(int fldNumber) {
    if (values.containsKey(fldNumber)) {
      return Timestamp.fromBuffer(values[fldNumber]!).toDateTime();
    }
    return null;
  }

  Decimal? asDecimal(int fldNumber) {
    if (values.containsKey(fldNumber)) {
      return FixedPoint.fromBuffer(values[fldNumber]!).decimal;
    }
    return null;
  }

  Strings? asStrings(int fldNumber) {
    if (values.containsKey(fldNumber)) {
      return Strings.fromBuffer(values[fldNumber]!);
    }
    return null;
  }

  T? asProto<T>(int fldNumber, Function(List<int>) prototype) {
    if (values.containsKey(fldNumber)) {
      return prototype(values[fldNumber]!);
    }
    return null;
  }

  @override
  List<Object?> get props => [slots];
}

