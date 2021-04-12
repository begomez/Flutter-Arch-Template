import 'package:flutter/material.dart';
import 'package:flutter_template/network/response/core/BaseResponse.dart';

class LogoutResponse extends BaseResponse {
  final bool flag;

  const LogoutResponse({@required this.flag})
      : assert(flag != null),
        super();
}
