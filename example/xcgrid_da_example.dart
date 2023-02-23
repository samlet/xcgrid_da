import 'package:xcgrid_da/xcgrid_da.dart';
import 'package:xcgrid_da/agents_wrapper.dart';
import 'dart:io';

Future<void> main(List<String> arguments) async {
  initRegs();

  var ft=locator<FixtureObjectsAgent>();
  var prod=await ft.oneProduct();
  var price=await prod.agent.getDefaultPrice();
  print("price: ${price.decimal}");

  var note=await ft.oneNote();
  print("note: ${await note.agent.getContent()}");
  exit(0);
}

