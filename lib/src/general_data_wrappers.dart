import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:fixnum/fixnum.dart';
import 'dart:convert';
import '../common_proto.dart';

final _log = Logger('DataHelper');

class DataHelper {
  static Timestamp now() {
    return fromDateTime(DateTime.now());
  }

  static Timestamp fromDateTime(DateTime dateTime) {
    var micros = dateTime.microsecondsSinceEpoch;
    var seconds = micros ~/ Duration.microsecondsPerSecond;
    var nanos = (micros % Duration.microsecondsPerSecond).toInt() * 1000;
    return Timestamp(seconds: Int64(seconds), nanos: nanos);
  }

}

extension TimestampForDateTime on DateTime {
  Timestamp get ts {
    return DataHelper.fromDateTime(this);
  }
}

extension FixedPointForString on String {
  FixedPoint get fixedPoint {
    var num = Decimal.parse(this);
    var val = num.shift(num.scale);
    return FixedPoint(
        value: Int64(val.toBigInt().toInt()),
        scalingPosition: num.scale);
  }
}

var timeFormat = DateFormat("HH:mm:ss.SSS");

extension DateTimeForString on String{
  /// Support format:
  ///   '2022-05-19T02:02:00.843+08:00'
  ///   "2009-01-09 00:00:00.000"
  Timestamp get ts {
    return DataHelper.fromDateTime(DateTime.parse(this));
  }

  /// '20:18:04.333'
  TimeOfDay get time {
    var date = timeFormat.parse(this);
    return TimeOfDay(
        hours: date.hour,
        minutes: date.millisecond,
        seconds: date.second,
        nanos: date.millisecond * 1000000);
  }

  /// '2009-01-09'
  Date get date {
    var dt=DateTime.parse(this);
    return Date(year: dt.year, month: dt.month, day: dt.day);
  }
}

extension CurrencyForString on String {
  Currency get rmb {
    return Currency(currencyUomId: 'CNY', value: this);
  }

  Currency get usd {
    return Currency(currencyUomId: 'USD', value: this);
  }
}

extension NumTypeForString on String{
  int? get integer {
    var value = int.tryParse(this);
    return value;
  }

  double? get floatingPoint {
    var value = double.tryParse(this);
    return value;
  }
}

extension IndicatorTypeForString on String{
  String get indicator{
    switch(this){
      case 'Y': return 'YES';
      case 'N': return 'NO';
      case '1': return 'FIRST';
      case '2': return 'SECOND';
      default:
        _log.warning('Unsupported indicator value $this, default to NO');
        return 'NO';
    }
  }
}