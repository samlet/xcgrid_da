import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:protobuf/protobuf.dart';
import 'package:recase/recase.dart';
import 'package:slugid/slugid.dart';
import 'package:tuple/tuple.dart';

Map<String, dynamic> translateMap(Map<String, dynamic> dataMap) {
  Map<String, dynamic> elements={};
  dataMap.forEach((key, value) => { elements[key.camelCase]=value });
  return elements;
}

String slugId(){
  return Slugid.nice().toString();
}

JsonDecoder _decoder = const JsonDecoder();
JsonEncoder _encoder = const JsonEncoder.withIndent('  ');

void pretty(Object? obj){
  String prettyprint = _encoder.convert(obj);
  print(prettyprint);
}

// https://gist.github.com/kasperpeulen/d61029fc0bc6cd104602
void prettyPrintJson(String input) {
  var object = _decoder.convert(input);
  var prettyString = _encoder.convert(object);
  prettyString.split('\n').forEach((element) => print(element));
}


String asProtoString(GeneratedMessage params) {
  var bytes=params.writeToBuffer();
  return base64Encode(bytes);
}

String getDataCols(List<String> cols, GeneratedMessage p) {
  return cols.map((e) {
    int? tag = p.getTagNumber(e);
    var fld = tag != null ? p.getField(tag) : "";
    return fld ?? "";
  }).join(", ");
}

void initLogger() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
  });
}

void clearNulls(Map<dynamic, dynamic> map){
  map.removeWhere((key, value) => key == null || value == null);
}

num sumList(List<num> xs) =>
    xs.fold(0, (num acc, num x) => acc + x);

void printLines(Iterable<String?> list) {
  for (var value in list) {
    print(value);
  }
}

void printTuples(List<Tuple2<String, String>>? years) {
  years?.forEach((element) {
    print(element);
  });
}
