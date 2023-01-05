import 'dart:convert';
import 'dart:ffi';
import 'package:fixnum/fixnum.dart';
import 'package:decimal/decimal.dart';
import 'package:protobuf/protobuf.dart';
import 'package:xcgrid_da/common_proto.dart';

void main(List<String> arguments) {
  var val = ValueData()
    ..clobValue = utf8.encode('hello')
    ..typeAnnotation.addAll(['simple', 'tag']);
  print(val);
  print(val.whichKind()); // ValueData_Kind.clobValue

  //
  var dt = DateTime.parse("2002-02-27T14:00:00-0500");
  var releaseDate = Timestamp.fromDateTime(dt);
  print(releaseDate);

  //
  var quantity = FixedPoint()
    ..value = Int64(55)
    ..scalingPosition = 1;
  print(quantity.toProto3Json());
  quantity.scalingPosition = 2;
  print(quantity.toProto3Json());

  quantity.freeze();
  quantity = quantity.rebuild((u) => {u.scalingPosition = 1});
  print("after rebuild -> ${quantity.toProto3Json()}");

  var num = Decimal.parse('5.55');
  print("${num.scale}, ${num.shift(num.scale)}");

  print(asFixedPoint("5.55"));

  var fp = asFixedPoint("5.55");
  Decimal d = asDecimal(fp);
  print("decimal: ${d}, +18.5 = ${d + Decimal.parse('18.5')}");

  //
  print('empty-default: (${Empty.getDefault()})');
}

Decimal asDecimal(FixedPoint fp) {
  var d = Decimal.fromInt(fp.value.toInt()).shift(-fp.scalingPosition);
  return d;
}

FixedPoint asFixedPoint(String numVal) {
  var num = Decimal.parse(numVal);
  var intVal = num.shift(num.scale).toBigInt().toInt();
  return FixedPoint(value: Int64(intVal), scalingPosition: num.scale);
}
