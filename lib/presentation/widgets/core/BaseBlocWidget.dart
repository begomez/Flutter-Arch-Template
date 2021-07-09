import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/core/BaseModel.dart';
import 'package:flutter_template/domain/bloc/core/BaseBloc.dart';
import 'package:flutter_template/domain/event/core/BaseEvent.dart';
import 'package:flutter_template/presentation/widgets/core/BaseStatefulWidget.dart';
import 'package:flutter_template/presentation/widgets/core/BlocMixin.dart';
import 'package:flutter_template/presentation/widgets/convenient/AppErrorWidget.dart';
import 'package:flutter_template/presentation/widgets/convenient/AppLoadingWidget.dart';

/*
 * Base class for widgets that use BLoC to perform some operation like data retrieval,
 * data storage, etc.
 */
abstract class BaseBlocWidget<TargetBloc extends BaseBloc>
    extends BaseStatefulWidget {

  const BaseBlocWidget({Key key}) : super(key: key);

  @override
  BaseBlocWidgetState createState();
}

/*
 * Companion state class  
 * 
 * It is a generic class receiving:
 *
 * - TargetWidget: data type for widget binded to this state obj
 * - TargetBloc: data type for the BLoC declared in the underlying mixin
 * - TargetEvent: data type for the event used as bloc input
 * - TargetModel: data type for the model returned by bloc
 */
abstract class BaseBlocWidgetState<
        TargetWidget extends BaseBlocWidget,
        TargetBloc extends BaseBloc,
        TargetEvent extends BaseEvent,
        TargetModel extends BaseModel>
    extends BaseStatefulWidgetState<TargetWidget>
    with BlocMixin<TargetBloc, TargetEvent, TargetModel> {

  BaseBlocWidgetState() : super() {
    this.initMixin(autocall: this.getAutocallFlag(), bloc: this.getBlocInstance());
  }

  @override
  void didChangeDependencies() {
    if (this.launchesAutomatically()) {
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
  Widget buildLoading(BuildContext cntxt) =>
      Stack(
        children: [this.buildInitial(cntxt), AppLoadingWidget()],
      );

  @override
  Widget buildError(BuildContext cntxt) {
    return AppErrorWidget();
  }

  /*
   * Returns flag for autocall behavior
   */
  bool getAutocallFlag();

  /*
   * Returns instance of BLoC required by widget
   */
  TargetBloc getBlocInstance();
}