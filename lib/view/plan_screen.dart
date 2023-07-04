import 'package:flutter/material.dart';
import 'package:quiz_app/model/plan_provider.dart';
import '../model/data_layer.dart'; //.. folder -s garah

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final plan = Plan();
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final plan = PlanProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Master plan'),
      ),
      body: Column(
        children: [
          Expanded(child: _buildList()),
          SafeArea(
              child: Text(
            plan.complenetnessMessage,
          )),
        ],
      ),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  Widget _buildAddTaskButton() {
    final plan = PlanProvider.of(context);
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        setState(() {
          plan.tasks.add(Task());
        });
        // Task task1 = Task(
        //   description: '1-р даалгавар',
        //   complete: false,
        // );
        // task1.complete = true;
        // task1.description = '2-р даалгавар';
        // task1.date = '2023-07-03';
        // task1.updateTask(
        //   description: 'Зассан 3',
        //   complete: false,
        //   date: '2023-07-03',
        // );
        // print(task1.date);
      },
    );
  }

  Widget _buildList() {
    final plan = PlanProvider.of(context);
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(
        plan.tasks[index],
      ),
    );
  }

  Widget _buildTaskTile(Task task) {
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (value) {
          setState(() {
            task.complete = value!;// true, false
            print(value);
          });
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (value) {
          setState(() {
            task.description = value;
          });
        },
      ),
    );
  }
}
