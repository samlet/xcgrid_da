import 'package:xcgrid_da/common_proto.dart';

void main(List<String> arguments) {
  var protoVal=StringValue(value: 'hi');
  // print(protoVal.writeToJson()); // {"1":"hi"}
  print(protoVal.toProto3Json());

  var protoConv=StringValue.fromJson("""{"1":"hi"}""");
  print(protoConv);

  var proto3Conv=StringValue()..mergeFromProto3Json('hi');
  print(proto3Conv);

  // decimal
  var quantity = FixedPoint()
    ..value = Int64(55)
    ..scalingPosition = 1;
  print(quantity.toProto3Json());

  // date & time
  var date = Date(year: 1999, month: 12, day: 12);
  print("proto-date => ${date.toProto3Json()}");

  var time = TimeOfDay(hours: 5, minutes: 6, seconds: 7);
  print("proto-time => ${time.toProto3Json()}");

  //

}
