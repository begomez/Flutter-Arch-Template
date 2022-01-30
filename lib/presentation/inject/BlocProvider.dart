import 'package:flutter/material.dart';
import 'package:flutter_template/domain/bloc/core/BaseBloc.dart';

/*
 * Class used to inject BLoC's across the widget tree.
 * 
 * It is a generic class containing:
 *
 * - TargetBloc: data type for the BLoC object we want to inject in the tree
 */
class BlocProvider<TargetBloc extends BaseBloc?> extends StatefulWidget {
  final Widget child;
  final TargetBloc bloc;

  const BlocProvider({required this.child, required this.bloc, Key? key})
      : assert(child != null),
        assert(bloc != null),
        super(key: key);

  static TargetBloc of<TargetBloc extends BaseBloc>(BuildContext cntxt) {
    final candidate = cntxt.findAncestorWidgetOfExactType<BlocProvider<TargetBloc>>()!;

    return candidate.bloc;
  }

  @override
  State<StatefulWidget> createState() => _BlocProviderState();
}

/*
 * Companion state class
 */
class _BlocProviderState extends State<BlocProvider> {
  _BlocProviderState() : super();

  @override
  Widget build(BuildContext context) {
    return this.widget.child;
  }

  @override
  void dispose() {
    this.widget.bloc.dispose();

    super.dispose();
  }
}
