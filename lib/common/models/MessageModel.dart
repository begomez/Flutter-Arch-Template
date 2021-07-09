import 'package:flutter_template/common/models/core/BaseModel.dart';

/*
 * Model that encapsulates key-value pairs
 */
class MessageModel extends BaseModel {
  final String title;
  final String descrip;

  const MessageModel([this.title = "", this.descrip = ""]) : super();
}