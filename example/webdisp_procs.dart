import 'dart:io';

import 'package:xcgrid_da/common_proto.dart' as proto;
import 'package:xcgrid_da/src/webagents/note_co.dart';
import 'package:dio/dio.dart';

final dio = Dio();

Future<void> main(List<String> arguments) async {
  try {
    // as json
    var coUri = 'http://localhost:9080/dispatch/NoteCo';
    var handle = {"regionId": "default", "bundleId": "note_1"};
    await dio.post(coUri, data: {
      'setContent': {'handle': handle, 'cnt': 'changed.'}
    });
    Response<dynamic> response = await getNoteContent(coUri, handle);
    print("json-result => ${response}");

    // as proto
    var protoUri = 'http://localhost:9080/dispatchAsProto/NoteCo';
    Response<List<int>> protoResponse =
    await getNoteContentAsBytes(protoUri, handle);
    var resultVal = proto.StringValue.fromBuffer(protoResponse.data!);
    print("proto-result => $resultVal");

    // on web class
    var note=NoteCoOnWeb(bundleId: 'note_1');
    await note.setContent('set by on-web-class');
    var cnt=await note.getContent();
    print("on-web-result => $cnt");

  } catch (e) {
    print(e);
  }

  exit(0);
}

Future<Response<dynamic>> getNoteContent(String coUri,
    Map<String, Object> handle) async {
  var response = await dio.post(coUri, data: {"getContent": handle});
  return response;
}

Future<Response<List<int>>> getNoteContentAsBytes(String coUri,
    Map<String, Object> handle) async {
  Response<List<int>> rs = await dio.post<List<int>>(
    coUri,
    data: {"getContent": handle},
    options: Options(
        responseType: ResponseType.bytes), // set responseType to `bytes`
  );
  return rs;
}
