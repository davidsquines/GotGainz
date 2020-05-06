import 'package:fitness_app/ui/next-button.dart';
import 'package:flutter/material.dart';

class UserInputForm extends StatelessWidget {
  UserInputForm({
    @required this.formKey,
    @required this.text,
    @required this.firstUserInput,
    this.secondUserInput,
    @required this.nextButton,
  });

  final GlobalKey<FormState> formKey;
  final String text;
  final Widget firstUserInput;
  final Widget secondUserInput;
  final NextButton nextButton;

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
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    firstUserInput,
                    if (secondUserInput != null) secondUserInput,
                    SizedBox(
                      height: 10.0,
                    ),
                    nextButton,
                    SizedBox(
                      height: 10.0,
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
