import 'package:flutter/material.dart';

class ShowAlertDialog {
  ShowAlertDialog({
    @required this.cancelButtonToggle,
    @required this.mainButtonText,
    @required this.mainButtonOnPressed,
    @required this.alertTitle,
    @required this.alertContent,
  });

  final bool cancelButtonToggle;
  final String mainButtonText;
  final Function mainButtonOnPressed;
  final String alertTitle;
  final String alertContent;

  void showAlertDialog(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text('Cancel'),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget mainButton = FlatButton(
      child: Text(mainButtonText),
      onPressed: mainButtonOnPressed,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(alertTitle),
          content: Text(alertContent),
          actions: [
            if (cancelButtonToggle == true) cancelButton,
            mainButton,
          ],
        );
      },
    );
  }
}
