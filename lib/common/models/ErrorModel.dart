import 'package:flutter_template/common/models/core/BaseModel.dart';
import 'package:flutter_template/domain/ErrorCodes.dart';

class ErrorModel extends BaseModel {
  static const int NO_ERROR_CODE = ErrorCodes.INVALID;
  static const String NO_DESCRIP = "";

  final int code;
  final String descrip;

  const ErrorModel({this.code = NO_ERROR_CODE, this.descrip = NO_DESCRIP})
      : super();

  factory ErrorModel.empty() => ErrorModel();

  bool validate() => this.code != NO_ERROR_CODE && this.descrip.isNotEmpty;
}
