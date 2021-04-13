import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/core/BaseModel.dart';
import 'package:flutter_template/domain/bloc/core/BaseBloc.dart';
import 'package:flutter_template/domain/dto/core/BaseDTO.dart';
import 'package:flutter_template/presentation/widgets/base/BaseStatefulWidget.dart';
import 'package:flutter_template/presentation/widgets/base/BlocMixin.dart';
import 'package:flutter_template/presentation/widgets/convenient/AppErrorWidget.dart';
import 'package:flutter_template/presentation/widgets/convenient/AppLoadingWidget.dart';

/**
 * Base class for widgets with dynamic state that uses BLoC to perform some operation (data retrieval, data creation, etc).
 */
abstract class BaseStatefulWidgetWithBloc<TargetBloc extends BaseBloc>
    extends BaseStatefulWidget {
  const BaseStatefulWidgetWithBloc({Key key}) : super(key: key);

  @override
  BaseStatefulWidgetWithBlocState createState();
}

/**
 * Companion state class
 * It is a generic class receiving:
 * - TargetBloc: bloc used by the inner mixin
 * - TargetData: data model returned by previous bloc
 * - TargetDTO: params model used as previous bloc input
 */
abstract class BaseStatefulWidgetWithBlocState<TargetBloc extends BaseBloc,
        TargetData extends BaseModel, TargetDTO extends BaseDTO>
    extends BaseStatefulWidgetState<BaseStatefulWidgetWithBloc>
    with BlocMixin<TargetBloc, TargetData, TargetDTO> {
  BaseStatefulWidgetWithBlocState(
      {bool autocall = false, TargetBloc bloc = null})
      : super() {
    this.initMixin(autocall: autocall, bloc: bloc);
  }

  @override
  void didChangeDependencies() {
    if (this.autocall) {
      this.call();
    }

    super.didChangeDependencies();
  }

  @override
  Widget buildWidgetContents(BuildContext context) {
    if (this.hasBloc()) {
      return this.buildWidgetAccordingToState(context);
    } else {
      return Container(
          alignment: Alignment.center,
          width: double.maxFinite,
          color: Colors.red,
          child: Text("Call initMixin(params) from constructor()"));
    }
  }

  @override
  Widget buildLoading(BuildContext cntxt) => Stack(
        children: [this.buildInitial(cntxt), AppLoadingWidget()],
      );

  @override
  Widget buildError(BuildContext cntxt) {
    return AppErrorWidget();
  }
}
