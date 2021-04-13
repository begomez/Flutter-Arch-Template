import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/core/BaseModel.dart';

class UserSessionModel extends BaseModel {
  final String name;
  final String mail;
  final String token;

  factory UserSessionModel.invalid() =>
      UserSessionModel(name: "", mail: "", token: "");

  const UserSessionModel(
      {@required this.name, @required this.mail, @required this.token})
      : assert(name != null),
        assert(mail != null),
        assert(token != null),
        super();

  bool validate() =>
      this.name.isNotEmpty && this.mail.isNotEmpty && this.token.isNotEmpty;
}
