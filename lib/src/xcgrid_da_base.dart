import 'package:get_it/get_it.dart';
import 'agent/fixture_objects.dart';
import 'agent/generic_bundles.dart';
import 'xcrpc_client.dart';
import 'agent/preset_dispatcher.dart';
import 'agent/billboard_on_slab.dart';
import 'util.dart';

GetIt locator = GetIt.instance;
final _log = Logger('xcgrid_da');

void initRegs({bool withDefaults: true}){
  initLogger();

  _log.info("init component-regs.");

  locator.registerLazySingleton<XcClient>(() => XcClient());

  if(withDefaults) {
    locator.registerLazySingleton<PresetDispatcherAgent>(
            () => locator.get<XcClient>().presetDispatcherAgent());
    locator.registerLazySingleton<BillboardOnSlabAgent>(
            () => locator.get<XcClient>().billboardOnSlabAgent());
    locator.registerLazySingleton<FixtureObjectsAgent>(
            () => locator.get<XcClient>().fixtureObjectsAgent());

    // GenericBundlesAgent
    locator.registerLazySingleton<GenericBundlesAgent>(
            () => locator.get<XcClient>().genericBundlesAgent());
  }
}

