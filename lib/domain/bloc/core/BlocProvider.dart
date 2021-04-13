import 'package:flutter/material.dart';
import 'package:flutter_template/domain/bloc/core/BaseBloc.dart';

/**
 * Class used to inject BLoC's across the widget tree
 */
class BlocProvider<T extends BaseBloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BlocProvider({@required this.child, @required this.bloc, Key key})
      : assert(child != null),
        assert(bloc != null),
        super(key: key);

  static T of<T extends BaseBloc>(BuildContext cntxt) {
    final candidate = cntxt.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return candidate.bloc;
  }

  @override
  State<StatefulWidget> createState() => _BlocProviderState();
}

/**
 * Companion state obj
 */
class _BlocProviderState extends State<BlocProvider> {
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
