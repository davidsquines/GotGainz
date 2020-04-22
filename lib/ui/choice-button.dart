import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  ChoiceButton({@required this.text, @required this.onPressed});

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.deepOrange),
      ),
      minWidth: 200.0,
      height: 50.0,
      color: Colors.lightBlueAccent,
      textColor: Colors.black,
      onPressed: onPressed,
      child: Text(
        text,
      ),
    );
  }
}
