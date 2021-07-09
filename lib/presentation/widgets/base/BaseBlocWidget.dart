import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/core/BaseModel.dart';
import 'package:flutter_template/domain/bloc/core/BaseBloc.dart';
import 'package:flutter_template/domain/event/core/BaseEvent.dart';
import 'package:flutter_template/presentation/widgets/base/BaseStatefulWidget.dart';
import 'package:flutter_template/presentation/widgets/base/BlocMixin.dart';
import 'package:flutter_template/presentation/widgets/convenient/AppErrorWidget.dart';
import 'package:flutter_template/presentation/widgets/convenient/AppLoadingWidget.dart';

/**
 * Base class for widgets with dynamic state that use BLoC to perform some operation
 * (data retrieval, data creation, etc).
 */
abstract class BaseBlocWidget<TargetBloc extends BaseBloc>
    extends BaseStatefulWidget {
  const BaseBlocWidget({Key key}) : super(key: key);

  @override
  BaseBlocWidgetState createState();
}

/**
 * Companion state class  
 * 
 * It is a generic class receiving:
 * - TargetWidget: widget binded to this state obj
 * - TargetBloc: bloc used by the inner mixin
 * - TargetModel: data model returned by previous bloc
 * - TargetEvent: params model used as previous bloc input
 */
abstract class BaseBlocWidgetState<
        TargetWidget extends BaseBlocWidget,
        TargetBloc extends BaseBloc,
        TargetModel extends BaseModel,
        TargetEvent extends BaseEvent>
    extends BaseStatefulWidgetState<TargetWidget>
    with BlocMixin<TargetBloc, TargetModel, TargetEvent> {
  BaseBlocWidgetState({bool autocall = false, TargetBloc bloc}) : super() {
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
