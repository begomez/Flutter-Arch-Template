import 'package:flutter/material.dart';
import 'package:flutter_template/network/request/core/BaseRequest.dart';

class LoginRequest extends BaseRequest {
  final String user;
  final String pass;

  const LoginRequest({@required this.user, @required this.pass})
      : assert(user != null),
        assert(pass != null),
        super();
}
