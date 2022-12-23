import '../../common_proto.dart';
import '../xcrpc_client.dart';
import '../generated/note_co.pbgrpc.dart';

extension NoteCoSet on XcClient {
  NoteCoServiceClient noteCo(){
    return NoteCoServiceClient(channel);
  }
}

class NoteCoAgent {
  final NoteCoServiceClient client;
  final NoteCoHandle handle;

  NoteCoAgent(this.client, this.handle);

  Future<StringValue> getContent() async {
    return await client.getContent(handle);
  }

  Future<Empty> setContent(String cnt) async {
    return await client.setContent(NoteCoSetContentRequest()
      ..handle = handle
      ..cnt = cnt);
  }
}
