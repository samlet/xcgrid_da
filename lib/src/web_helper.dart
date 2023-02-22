import 'package:dio/dio.dart';
import 'package:protobuf/protobuf.dart';

final dio = Dio();
const String defaultRegion = 'default';

Future<List<int>?> requestAsBytes(
    String coType, GeneratedMessage requestMsg) async {
  String coUri = 'http://127.0.0.1:9080/dispatchAsProto/$coType';
  Response<List<int>> rs = await dio.post<List<int>>(
    coUri,
    data: requestMsg.toProto3Json(),
    options: Options(
      responseType: ResponseType.bytes,
      headers: {
        'content-type': 'application/json',
        'Access-Control-Allow-Origin': '*'
      },
    ), // set responseType to `bytes`
  );
  return rs.data;
}
