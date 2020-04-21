import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  NextButton({@required this.onPressed});

  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.bottomEnd,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minWidth: 30.0,
        height: 48.0,
        color: Colors.lightBlueAccent,
        textColor: Colors.white,
        child: Icon(Icons.arrow_forward),
        onPressed: onPressed,
      ),
    );
  }
}
