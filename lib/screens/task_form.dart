import 'package:awesomity_challenge/models/task.dart';
import 'package:awesomity_challenge/utils/constants.dart';
import 'package:awesomity_challenge/widgets/shared/form_input.dart';
import 'package:awesomity_challenge/widgets/shared/primary_button.dart';
import 'package:flutter/material.dart';

class TaskFormScreen extends StatefulWidget {
  static const routeName = "/task-form";

  @override
  _TaskFormScreenState createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> priorities = [
      {"name": "HIGH", "value": Priority.high},
      {"name": "MEDIUM", "value": Priority.medium},
      {"name": "LOW", "value": Priority.low},
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Constants.PRIMARY_DARK_COLOR,
            size: 25,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 7,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("New task", style: Theme.of(context).textTheme.headline1),
                SizedBox(height: 30),
                FormInput(
                  label: "Image URL",
                  multiline: false,
                ),
                SizedBox(height: 30),
                FormInput(
                  label: "Title",
                  multiline: false,
                ),
                SizedBox(height: 30),
                FormInput(
                  label: "Description",
                  multiline: true,
                ),
                SizedBox(height: 30),
                DropdownButtonFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Constants.LIGHT_COLOR,
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                    ),
                    items: priorities
                        .map((e) => DropdownMenuItem(
                              child: Text(e["name"]),
                              value: e["value"],
                            ))
                        .toList(),
                    onChanged: (val) {
                      print(val);
                    }),
                SizedBox(height: 30),
                PrimaryButton(title: "Create task", onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
