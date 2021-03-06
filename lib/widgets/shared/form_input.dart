import 'package:awesomity_challenge/utils/constants.dart';
import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String label;
  bool multiline;
  final Function onSaved;

  FormInput({
    @required this.label,
    this.multiline = false,
    @required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        TextFormField(
          validator: (value) {
            if (value.isEmpty) return "This field can't be empty";
            return null;
          },
          onSaved: onSaved,
          textInputAction: TextInputAction.next,
          maxLines: multiline ? 6 : 1,
          keyboardType:
          multiline ? TextInputType.multiline : TextInputType.text,
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
        )
      ],
    );
  }
}
