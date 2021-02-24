import 'package:awesomity_challenge/models/task.dart';
import 'package:awesomity_challenge/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class TaskItemWidget extends StatelessWidget {
  final Task task;
  final int num;

  const TaskItemWidget({Key key, this.task, this.num}) : super(key: key);

  Widget _buildBadge() {
    print(task.priority);
    if (task.priority == Priority.high)
      return Chip(
          label: Text(
            "High",
            style: TextStyle(color: Constants.SECONDARY_COLOR),
          ),
          backgroundColor: Constants.PRIMARY_DARK_COLOR);
    else if (task.priority == Priority.medium)
      return Chip(
          label: Text("Medium", style: TextStyle(color: Colors.white),),
          backgroundColor: Constants.PRIMARY_LIGHT_COLOR);
    else
      return Chip(label: Text("Low"), backgroundColor: Constants.LIGHT_COLOR);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(task.done?Icons.check_box:Icons.check_box_outlined,size: 35,color: Constants.PRIMARY_COLOR,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$num ${task.title}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  _buildBadge(),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * .7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Created ${DateFormat.yMMMd().format(task.createdAt)}",
                            style: Theme.of(context).textTheme.subtitle1),
                        Text(
                            "Modified ${DateFormat.yMMMd().format(task.updatedAt)}",
                            style: Theme.of(context).textTheme.subtitle1),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
