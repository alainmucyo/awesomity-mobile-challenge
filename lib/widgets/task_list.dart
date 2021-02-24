import 'package:awesomity_challenge/providers/task_provider.dart';
import 'package:awesomity_challenge/screens/task_form.dart';
import 'package:awesomity_challenge/utils/constants.dart';
import 'package:awesomity_challenge/widgets/shared/primary_button.dart';
import 'package:awesomity_challenge/widgets/task_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  var num = 1;

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TasksProvider>(context);
    if (tasks.items.isEmpty) {
      return Column(
        children: [
          SizedBox(height: 10),
          Center(
            child: Text(
              "NOTHING HERE",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Just like your crush's replies",
            style: TextStyle(color: Constants.PRIMARY_LIGHT_COLOR, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20),
          PrimaryButton(title: "Start with a new task", onPressed: ()=>Navigator.pushNamed(context, TaskFormScreen.routeName))
        ],
      );
    }
    return Column(
      children: [
        ...tasks.items
            .map((e) => TaskItemWidget(
                  task: e,
                  num: 1,
                  key: ValueKey(e.id),
                ))
            .toList()
      ],
    );
  }
}
