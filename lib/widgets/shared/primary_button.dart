import 'package:awesomity_challenge/utils/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const PrimaryButton({Key key, @required this.title, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPressed,
        color: Constants.PRIMARY_DARK_COLOR,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))  ,
        child: Text(
          title.toUpperCase(),
          style: TextStyle(color: Colors.white),
        ));
  }
}
