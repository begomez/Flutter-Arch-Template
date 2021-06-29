import 'package:flutter_template/common/models/core/BaseModel.dart';

/**
 * Data model wrapping a boolean value
 */
class BooleanWrapper extends BaseModel {
  final bool flag;

  const BooleanWrapper({this.flag = false}) : super();
}
