import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:xcgrid_da/preset_common.dart';
import 'package:xcgrid_da/src/agent/billboard_on_slab.dart';
import 'package:xcgrid_da/xcrpc_api.dart';

GetIt locator = GetIt.instance;

Future<void> main(List<String> arguments) async {
  locator.registerLazySingleton<XcClient>(() => XcClient());

  // with async-deps
  // locator.registerSingletonAsync<XcClient>(() async => XcClient());
  // locator.registerSingletonWithDependencies<PresetDispatcherAgent>(
  //     () => locator.get<XcClient>().presetDispatcherAgent(),
  //     dependsOn: [XcClient]);
  // locator.registerSingletonWithDependencies<BillboardOnSlabAgent>(
  //     () => locator.get<XcClient>().billboardOnSlabAgent(),
  //     dependsOn: [XcClient]);

  locator.registerLazySingleton<PresetDispatcherAgent>(
          () => locator.get<XcClient>().presetDispatcherAgent());
  locator.registerLazySingleton<BillboardOnSlabAgent>(
          () => locator.get<XcClient>().billboardOnSlabAgent());

  locator.registerFactoryParam<NoteCoAgent, String, String>(
      (regionId, bundleId) =>
          locator.get<XcClient>().noteCoAgent(bundleId, regionId: regionId));

  var note = locator<NoteCoAgent>(param1: "default", param2: "note_1");
  var cnt = await note.getContent();
  print("result -> ${cnt.value}");

  var cartXid = await locator<BillboardOnSlabAgent>()
      .walletCart(StringValue(value: "buyer1"));
  print("cart -> $cartXid");

  exit(0);
}

