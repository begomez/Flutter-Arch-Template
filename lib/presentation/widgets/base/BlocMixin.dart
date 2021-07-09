import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/core/BaseModel.dart';
import 'package:flutter_template/common/models/result/ResourceResult.dart';
import 'package:flutter_template/domain/bloc/core/BaseBloc.dart';
import 'package:flutter_template/presentation/inject/BlocProvider.dart';
import 'package:flutter_template/domain/event/core/BaseEvent.dart';

/**
 * Mixin used to hook BLoC functionality on widgets.
 * 
 * It is a generic class receiving:
 * - TargetBloc: bloc used by the mixin
 * - TargetModel: data model returned by previous bloc
 * - TargetEvent: params model used as previous bloc input
 */
mixin BlocMixin<
    TargetBloc extends BaseBloc,
    TargetModel extends BaseModel,
    TargetEvent extends BaseEvent> {
  TargetBloc bloc = null;
  bool autocall = false;

  //XXX: must be invoked since mixins have no constructors
  void initMixin({TargetBloc bloc, bool autocall}) {
    this.bloc = bloc;
    this.autocall = autocall;
  }

  /**
   * Perform bloc operation
   */
  void call() {
    TargetEvent dto = this.getEvent();

    // BLOC initialized
    if (this.hasBloc()) {
      // show loading
      this.bloc.processNewEvent(
          ResourceResult<TargetModel>(status: ResourceStatus.LOADING));

      // perform operation
      this.bloc.performOperation(dto);

      // NO BLOC available
    } else {
      throw UnimplementedError("No bloc available in mixin");
    }
  }

  bool hasBloc() => (this.bloc != null);

  /**
   * Returns a widget depending on current state
   */
  Widget buildWidgetAccordingToState(BuildContext context) {
    return BlocProvider(
        child: StreamBuilder<ResourceResult<TargetModel>>(
          stream: this.bloc.output,
          builder: (context, snap) {
            switch (snap?.data?.status) {
              case ResourceStatus.LOADING:
                return this.buildLoading(context);
              case ResourceStatus.ERROR:
                return this.buildError(context);
              case ResourceStatus.SUCCESS:
                return this.buildSuccess(context, snap.data.data);
              case ResourceStatus.INITIAL:
              default:
                return this.buildInitial(context);
            }
          },
        ),
        bloc: this.bloc);
  }

  /**
   * Widget to show when bloc is working
   */
  Widget buildLoading(BuildContext cntxt);

  /**
   * Widget to show when bloc fails
   */
  Widget buildError(BuildContext cntxt);

  /**
   * Widget to show when idle
   */
  Widget buildInitial(BuildContext cntxt);

  /**
   * Widget to show when operations finishes with no error
   */
  Widget buildSuccess(BuildContext cntxt, TargetModel data);

  /**
   * Returns object used as bloc input.
   */
  TargetEvent getEvent();
}
