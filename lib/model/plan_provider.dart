import 'package:flutter/material.dart';
import 'package:quiz_app/controller/plan_controller.dart';
import './data_layer.dart';

class PlanProvider extends InheritedWidget {
  final _controller = PlanController();
  PlanProvider({
    Key? key,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
  static PlanController of(BuildContext context){
    final provider = 
    context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    return provider!._controller;
  }
}
