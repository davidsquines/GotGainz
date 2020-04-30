import 'package:flutter/material.dart';

class DoneButton extends StatelessWidget {
  DoneButton({@required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.white70),
      ),
      minWidth: 150.0,
      height: 50.0,
      color: Colors.lightBlueAccent,
      textColor: Colors.black,
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[Text('I\m Done' .toUpperCase()), Icon(Icons.mood)],
      ),
    );

  }
}

