import 'package:flutter/material.dart';

class ShowAlertDialog {
  ShowAlertDialog({
    this.secondaryButtonText,
    this.secondaryButtonOnPressed,
    @required this.mainButtonText,
    @required this.mainButtonOnPressed,
    @required this.alertTitle,
    @required this.alertContent,
  });

  final String secondaryButtonText;
  final Function secondaryButtonOnPressed;
  final String mainButtonText;
  final Function mainButtonOnPressed;
  final String alertTitle;
  final String alertContent;

  void showAlertDialog(BuildContext context) {
    Widget secondaryButton = FlatButton(
      child: Text(secondaryButtonText),
      onPressed: secondaryButtonOnPressed,
    );
    Widget mainButton = FlatButton(
      child: Text(mainButtonText),
      onPressed: mainButtonOnPressed,
    );

    AlertDialog alert = AlertDialog(
      title: Text(alertTitle),
      content: Text(alertContent),
      actions: [
        if (secondaryButtonText != null) secondaryButton,
        mainButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
