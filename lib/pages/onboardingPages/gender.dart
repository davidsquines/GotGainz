import 'package:fitness_app/services/shared-pref-helper.dart';
import 'package:fitness_app/ui/choice-button.dart';
import 'package:fitness_app/ui/user-button-form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Gender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserButtonForm(
      text: 'What is your gender?',
      firstChoiceButton: ChoiceButton(
        text: 'MALE',
        onPressed: () {
          SharedPreferencesHelper.setGender(0);
          Navigator.of(context).pushNamed(
            '/fourth',
          );
        },
      ),
      secondChoiceButton: ChoiceButton(
        text: 'FEMALE',
        onPressed: () {
          SharedPreferencesHelper.setGender(1);
          Navigator.of(context).pushNamed(
            '/fourth',
          );
        },
      ),
    );
  }
}
