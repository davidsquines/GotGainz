import 'package:fitness_app/ui/choice-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UserButtonForm extends StatelessWidget {
  UserButtonForm({
    @required this.text,
    @required this.firstChoiceButton,
    @required this.secondChoiceButton,
    this.thirdChoiceButton,
  });

  final String text;
  final ChoiceButton firstChoiceButton;
  final ChoiceButton secondChoiceButton;
  final ChoiceButton thirdChoiceButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent, //TODO: Pick a color
        elevation: 0.0,
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(24.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    firstChoiceButton,
                    SizedBox(
                      height: 20.0,
                    ),
                    secondChoiceButton,
                    if (thirdChoiceButton != null)
                      SizedBox(
                        height: 20.0,
                      ),
                    if (thirdChoiceButton != null) thirdChoiceButton,
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
