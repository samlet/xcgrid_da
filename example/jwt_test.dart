import 'dart:io';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

void main(List<String> arguments) {
  hs256();
}

// HMAC SHA-256 algorithm
void hs256() {
  String token;

  /* Sign */ {
    // Create a json web token
    final jwt = JWT(
      {
        'id': 123,
        'server': {
          'id': '3e4fc296',
          'loc': 'euw-2',
        }
      },
      issuer: 'https://github.com/jonasroussel/dart_jsonwebtoken',
    );

    // Sign it
    token = jwt.sign(SecretKey('secret passphrase'));

    print('Signed token: $token\n');
  }

  /* Verify */ {
    try {
      // Verify a token
      final jwt = JWT.verify(token, SecretKey('secret passphrase'));

      print('Payload: ${jwt.payload}');
    } on JWTExpiredError {
      print('jwt expired');
    } on JWTError catch (ex) {
      print(ex.message); // ex: invalid signature
    }
  }

  testWithServer();
}

void testWithServer(){
  // token from: com.bluecc.hubs.qlrpc.prefabs.SecurityPrefabTest#testAuth
  String token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJvd25lciI6InNhbWxldCIs"
      "InpvbmUiOiJkZWZhdWx0IiwiaXNzIjoiYmx1ZWNjIiwiZXhwIjoxNjc0MzU5OTQ4LCJyZ"
      "Wdpb24iOiJkZWZhdWx0IiwibG9naW4iOiJzYW1sZXQiLCJAY29udGV4dCI6Imh0dHBzOi8vYmx1"
      "ZWNjLmNvbS8iLCJpYXQiOjE2NzM3NTUxNDgsImp0aSI6ImFCN1pTSTlrVmQyYXp0T3Z6ZnR0MWcifQ"
      "._LaM3R8PCITUwJTupxAYj3N2LFQs7f_gn-EvognnCoE";
  /* Verify */ {
    try {
      // Verify a token
      final jwt = JWT.verify(token, SecretKey('secret'));

      print('Payload: ${jwt.payload}');
    } on JWTExpiredError {
      print('jwt expired');
    } on JWTError catch (ex) {
      print(ex.message); // ex: invalid signature
    }
  }
}