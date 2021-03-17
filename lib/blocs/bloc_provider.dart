import 'package:flutter/material.dart';

abstract class BlocBase {
  Future getData({String labelId, int page});

  Future onRefresh({String labelId});

  Future onLoadMore({String labelId});

  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
    this.userDispose: true,
  }) : super(key: key);

  final T bloc;
  final Widget child;
  final bool userDispose;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context) {
    BlocProvider<T> provider =
        context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider.bloc;
  }
}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>> {
  @override
  void dispose() {
    if (widget.userDispose) widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
