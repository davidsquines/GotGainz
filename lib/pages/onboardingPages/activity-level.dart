import 'package:fitness_app/services/shared-pref-helper.dart';
import 'package:fitness_app/ui/choice-button.dart';
import 'package:fitness_app/ui/user-button-form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ActivityLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserButtonFormPage(
      text: 'What is your current activity level?',
      firstChoiceButton: ChoiceButton(
        text: 'Lightly Active',
        onPressed: () {
          SharedPreferencesHelper.setExperience(0);
          Navigator.of(context).pushNamed(
            '/eighth',
          );
        },
      ),
      secondChoiceButton: ChoiceButton(
        text: 'Moderately Active',
        onPressed: () {
          SharedPreferencesHelper.setExperience(1);
          Navigator.of(context).pushNamed(
            '/eighth',
          );
        },
      ),
      thirdChoiceButton: ChoiceButton(
        text: 'Very Active',
        onPressed: () {
          SharedPreferencesHelper.setExperience(2);
          Navigator.of(context).pushNamed(
            '/eighth',
          );
        },
      ),
    );
  }
}
