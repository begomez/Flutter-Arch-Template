import 'package:flutter/material.dart';
import 'package:flutter_template/domain/dto/core/BaseDTO.dart';

/**
 * Data transport object used to encapsulate params in login operation
 */
class LoginDTO extends BaseDTO {
  final String user;
  final String pass;

  const LoginDTO({@required this.user, @required this.pass})
      : assert(user != null),
        assert(pass != null),
        super();
}
