import 'package:flutter/material.dart';
import 'package:flutter_template/network/response/core/BaseResponse.dart';

/**
 * Response class that provides encapsulation for logout operation outputs
 */
class LogoutResponse extends BaseResponse {
  final bool flag;

  const LogoutResponse({@required this.flag})
      : assert(flag != null),
        super();
}
