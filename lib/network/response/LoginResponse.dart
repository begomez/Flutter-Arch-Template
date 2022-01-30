import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/UserSessionModel.dart';
import 'package:flutter_template/common/models/MessageModel.dart';
import 'package:flutter_template/network/response/core/BaseResponse.dart';

/*
 * Response class that provides encapsulation for login operation outputs
 */
class LoginResponse extends BaseResponse {
  final UserSessionModel user;
  final MessageModel msg;

  const LoginResponse({required this.user, this.msg = const MessageModel()})
      : assert(user != null),
        assert(msg != null),
        super();
}
