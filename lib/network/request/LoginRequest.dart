import 'package:flutter/material.dart';
import 'package:flutter_template/network/request/core/BaseRequest.dart';

/*
 * Class that provides encapsulation for login operation inputs
 */
class LoginRequest extends BaseRequest {
  final String user;
  final String pass;

  const LoginRequest({required this.user, required this.pass})
      : assert(user != null),
        assert(pass != null),
        super();
}
