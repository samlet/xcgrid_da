import 'package:grpc/grpc.dart';

// NoteCoServiceClient getNoteCo(XcClient xcClient) {
//   var rpcClient=NoteCoServiceClient(xcClient.channel);
//   return rpcClient;
// }

class XcClient{
  late ClientChannel channel;

  XcClient(){
    channel = defaultChannel();
  }
}

ClientChannel defaultChannel() {
  final channel = ClientChannel(
    'localhost',
    port: 9667,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      codecRegistry:
      CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );
  return channel;
}
