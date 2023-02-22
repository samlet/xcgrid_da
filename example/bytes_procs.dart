import 'dart:typed_data';

void main(List<String> arguments) {
  // bytes builder
  {
    final bytesBuilder = BytesBuilder();
    bytesBuilder.addByte(42);
    bytesBuilder.add([0, 5, 255]);
    Uint8List byteList = bytesBuilder.toBytes();
    print(byteList); // [42, 0, 5, 255]
  }

  // byte buffer
  {
    Uint8List bytes = Uint8List.fromList([1, 0, 0, 128]);
    ByteBuffer byteBuffer = bytes.buffer;
    Uint16List sixteenBitList = byteBuffer.asUint16List();
    print(sixteenBitList);
    // 00000001 00000000 00000000 10000000
    // 1        0        0        128
  }

  {
    // 00000000 00000001 00000010 00000011
    // 0        1        2        3
    Uint8List bytes = Uint8List.fromList([0, 1, 2, 3]);
    ByteBuffer byteBuffer = bytes.buffer;
    Uint32List thirtytwoBitList = byteBuffer.asUint32List();
    print(thirtytwoBitList);
    // The print statement reveals a value of 50462976, which in 32-bit binary is:
    // 00000011000000100000000100000000
  }
}

/*
⊕ [Working with bytes in Dart. If you can understand the bytes, you… | by Suragch | Medium]
  (https://suragch.medium.com/working-with-bytes-in-dart-6ece83455721)

 */