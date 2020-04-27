import 'package:flutter/material.dart';

class DoneButton extends StatelessWidget {
  DoneButton({@required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 50.0,
      onPressed: onPressed,
      child: Text(
        'I\'m Done'.toUpperCase(),
      ),
      color: Colors.lightBlue,
      textColor: Colors.white,
    );
  }
}
