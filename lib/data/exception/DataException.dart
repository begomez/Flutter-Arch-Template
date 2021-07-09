import 'package:flutter_template/domain/ErrorCodes.dart';

/*
 * Custom exception for errors thrown in data layer
 */
class DataException {
  final int code;
  final String descrip;

  const DataException({this.code = ErrorCodes.INVALID, this.descrip = ""});
}
