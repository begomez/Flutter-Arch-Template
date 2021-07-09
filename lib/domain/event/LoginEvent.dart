import 'package:flutter/material.dart';
import 'package:flutter_template/domain/event/core/BaseEvent.dart';

/*
 * Event used to encapsulate params in login operation
 */
class LoginEvent extends BaseEvent {
  final String user;
  final String pass;

  const LoginEvent({@required this.user, @required this.pass})
      : assert(user != null),
        assert(pass != null),
        super();
}
