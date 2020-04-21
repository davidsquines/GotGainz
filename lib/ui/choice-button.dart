import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  ChoiceButton({@required this.text, @required this.onPressed});

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 200.0,
      height: 50.0,
      child: RaisedButton(
        child: Text(
          text,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.deepOrange),
        ),
        color: Colors.lightBlueAccent,
        textColor: Colors.black,
        onPressed: onPressed,
      ),
    );
  }
}
