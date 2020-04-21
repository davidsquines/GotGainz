import 'package:fitness_app/services/shared-pref-helper.dart';
import 'package:fitness_app/ui/choice-button.dart';
import 'package:fitness_app/ui/user-button-form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Motivation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserButtonFormPage(
      text: 'What is your motivation?',
      firstChoiceButton: ChoiceButton(
        text: 'TO GAIN STRENGTH',
        onPressed: () {
          SharedPreferencesHelper.setMotivation(0);
          Navigator.of(context).pushNamed(
            '/fifth',
          );
        },
      ),
      secondChoiceButton: ChoiceButton(
        text: 'TO LOSE WEIGHT',
        onPressed: () {
          SharedPreferencesHelper.setMotivation(1);
          Navigator.of(context).pushNamed(
            '/fifth',
          );
        },
      ),
    );
  }
}
