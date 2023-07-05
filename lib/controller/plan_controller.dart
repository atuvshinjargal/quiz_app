//new folder -> controller
//controller -> plan_controller.dart
import '../model/data_layer.dart';

class PlanController {
  final _plans = <Plan>[]; //plan[1].name, plan2
  List<Plan> get plans => List.unmodifiable(_plans);

  String _checkForDuplicates(
    Iterable<String> items,
    String text,
  ) {
    final duplicatedCount =
        items.where((element) => element.contains(text)).length;
    if (duplicatedCount > 0) {
      text += '${duplicatedCount + 1}';
    }
    return text;
  }

  void addNewplan({required String name}) {
    if (name.isEmpty) {
      return;
    }
    name = _checkForDuplicates(
      _plans.map(
        (plan) => plan.name,
      ),
      name,
    );
    final plan = Plan()..name = name;
    _plans.add(plan);
  }
  void deletePlan(Plan plan){
    _plans.remove(plan);
  }
}
