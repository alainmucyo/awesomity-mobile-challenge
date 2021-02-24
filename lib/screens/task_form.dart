import 'package:awesomity_challenge/models/task.dart';
import 'package:awesomity_challenge/providers/task_provider.dart';
import 'package:awesomity_challenge/utils/constants.dart';
import 'package:awesomity_challenge/widgets/shared/form_input.dart';
import 'package:awesomity_challenge/widgets/shared/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskFormScreen extends StatefulWidget {
  static const routeName = "/task-form";

  @override
  _TaskFormScreenState createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _priorities = [
      {"name": "HIGH", "value": Priority.high},
      {"name": "MEDIUM", "value": Priority.medium},
      {"name": "LOW", "value": Priority.low},
    ];
    final Task _newTask = Task();
    var _selectedPriority = Priority.low;
    void _submit() {
      var valid = _formKey.currentState.validate();
      if (!valid) return;
      _formKey.currentState.save();
      Provider.of<TasksProvider>(context,listen: false).addTask(_newTask);
      Navigator.pop(context);
    }

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
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("New task", style: Theme.of(context).textTheme.headline1),
                SizedBox(height: 30),
                FormInput(
                  label: "Image URL",
                  multiline: false,
                  onSaved: (val) => _newTask.image = val,
                ),
                SizedBox(height: 30),
                FormInput(
                  label: "Title",
                  multiline: false,
                  onSaved: (val) => _newTask.title = val,
                ),
                SizedBox(height: 30),
                FormInput(
                  label: "Description",
                  multiline: true,
                  onSaved: (val) => _newTask.description = val,
                ),
                SizedBox(height: 30),
                Text("Priority", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                DropdownButtonFormField(
                    validator: (value) {
                      if (value == null) return "This field is required";
                      return null;
                    },
                    value: _selectedPriority,
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
                    items: _priorities
                        .map((e) => DropdownMenuItem(
                              child: Text(e["name"]),
                              value: e["value"],
                            ))
                        .toList(),
                    onChanged: (val) {
                      _selectedPriority = val;
                    }),
                SizedBox(height: 30),
                PrimaryButton(title: "Create task", onPressed: _submit)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
