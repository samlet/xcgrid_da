import 'dart:io';
import 'package:xcgrid_da/xcrpc_api.dart';

Future<void> main(List<String> arguments) async {
  // await withRawRequest();
  var xc=XcClient();

  // var handle = NoteCoHandle()
  //   ..regionId = 'default'
  //   ..bundleId = 'note_1';
  // var note = NoteCoAgent(xc.noteCo(), handle);

  var note=xc.noteCoAgent('note_1', regionId: 'default');
  await note.setContent('hello, i changed');
  var cnt = await note.getContent();
  print('now the content -> ${cnt.value}');

  exit(0);
}

Future<void> withRawRequest() async {
  // var noteCo = getNoteCo(XcClient());
  var xc=XcClient();
  var noteCo=xc.noteCo();
  var cnt = await noteCo.getContent(NoteCoHandle()
    ..regionId = 'default'
    ..bundleId = 'note_1');
  print(cnt.value);

  var handle = NoteCoHandle()
    ..regionId = 'default'
    ..bundleId = 'note_1';
  await noteCo.setContent(NoteCoSetContentRequest()
    ..handle = handle
    ..cnt = 'changed');
  cnt = await noteCo.getContent(handle);
  print('changed cnt -> ${cnt.value}');
}

// --- agent ---
