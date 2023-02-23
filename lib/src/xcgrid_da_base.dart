import 'package:get_it/get_it.dart';
import 'agent/fixture_objects.dart';
import 'xcrpc_client.dart';
import 'agent/preset_dispatcher.dart';
import 'agent/billboard_on_slab.dart';
import 'util.dart';

GetIt locator = GetIt.instance;
final _log = Logger('xcgrid_da');

void initRegs(){
  initLogger();

  _log.info("init component-regs.");

  locator.registerLazySingleton<XcClient>(() => XcClient());
  locator.registerLazySingleton<PresetDispatcherAgent>(
          () => locator.get<XcClient>().presetDispatcherAgent());
  locator.registerLazySingleton<BillboardOnSlabAgent>(
          () => locator.get<XcClient>().billboardOnSlabAgent());
  locator.registerLazySingleton<FixtureObjectsAgent>(
          () => locator.get<XcClient>().fixtureObjectsAgent());
}

