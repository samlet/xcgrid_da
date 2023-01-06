
import '../common_proto.dart';

bool isNotFound(IdOrErr idOr) =>
    idOr.resultType == IdOrErr_ResultType.NOT_FOUND;

extension BundleKeyEx on BundleKey {
  String get fullId => "$region:$id";

  StringValue get fullIdVal => StringValue(value: fullId);

  String get region => regionId.isEmpty ? 'default' : regionId;
}
