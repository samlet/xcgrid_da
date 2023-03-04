import 'package:xcgrid_da/xcgrid_da.dart';
import 'package:xcgrid_da/agents_wrapper.dart';
import 'dart:io';

Future<void> main(List<String> arguments) async {
  initRegs();

  var ft = locator<FixtureObjectsAgent>();
  var prod = await ft.oneProduct();
  var price = await prod.agent.getDefaultPrice();
  print("price: ${price.decimal}");

  var note = await ft.oneNote();
  print("note: ${await note.agent.getContent()}");

  // query billboards
  var bundles = locator<GenericBundlesAgent>();
  var rs = await bundles.queryThumbnails(
      "Billboard", "default", "statusId='OPENED'");
  print("meta for rs: ${rs.metadata}");
  // meta for rs: values: {regionId : default}
  // values: {where : statusId='OPENED'}
  // values: {bundleName : Billboard}
  print("cols for rs: ${rs.cols.map((e) => [e.colName, e.colType]).toList()}");
  // cols for rs: [[statusId, id], [name, name]]
  rs.values.forEach((element) {
    print("- ${element.values}");
    // - {bundleId: seller1_board, statusId: OPENED,
    //    name: billboard for market169bd6ad8700d003}
  });

  exit(0);
}

