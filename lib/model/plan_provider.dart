import 'package:flutter/material.dart';
import './data_layer.dart';

class PlanProvider extends InheritedWidget {
  final _plan = Plan();
  PlanProvider({
    required Key key,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
