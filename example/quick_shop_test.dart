import 'package:xcgrid_da/src/xcrpc_client.dart';
import 'package:xcgrid_da/xcgrid_da.dart';
import 'package:xcgrid_da/agents_wrapper.dart';
import 'dart:io';

Future<void> main(List<String> arguments) async {
  initRegs();

  var soc = locator<XcClient>().quickShopOnChainAgent();

  String daStoreId = "daStore";
  var stock = await soc.getStockForDaStore(daStoreId);
  // print('stock => $stock');
  stock.values.forEach((key, value) {
    print('- $key: ${value.decimal}');
  });
  exit(0);
}

