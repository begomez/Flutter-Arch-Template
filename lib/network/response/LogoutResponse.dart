import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/MessageModel.dart';
import 'package:flutter_template/network/response/core/BaseResponse.dart';

/*
 * Response class that provides encapsulation for logout operation outputs
 */
class LogoutResponse extends BaseResponse {
  final bool flag;
  final MessageModel msg;

  const LogoutResponse({required this.flag, this.msg = const MessageModel()})
      : assert(flag != null),
        assert(msg != null),
        super();
}
