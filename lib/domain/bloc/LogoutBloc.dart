import 'package:flutter_template/common/models/BooleanWrapper.dart';
import 'package:flutter_template/domain/ErrorCodes.dart';
import 'package:flutter_template/domain/bloc/core/BaseBloc.dart';
import 'package:flutter_template/domain/event/LogoutEvent.dart';
import 'package:flutter_template/domain/repo/ILoginRepository.dart';

/*
 * BLoC used to perform logout operation
 */
class LogoutBloc extends BaseBloc<LogoutEvent, BooleanWrapper> {
  late ILoginRepository _repo;

  LogoutBloc(this._repo) : super();

  @override
  Future<BooleanWrapper> processEvent(LogoutEvent event) async {
    return BooleanWrapper(flag: await this._repo.logout());
  }

  @override
  int getErrorCode() => ErrorCodes.LOGOUT_ERROR;
}
