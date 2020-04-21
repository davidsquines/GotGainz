import 'package:fitness_app/services/shared-pref-helper.dart';
import 'package:fitness_app/ui/next-button.dart';
import 'package:fitness_app/ui/user-input-form.dart';
import 'package:fitness_app/ui/info-text-input.dart';

import 'package:flutter/material.dart';

class Height extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HeightState();
  }
}

class HeightState extends State<Height> {
  int _feet;
  int _inches;
  int _totalInches;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFeet() {
    return InfoTextInput(
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      labelText: 'Feet',
      validator: (value) {
        if (value.isEmpty) {
          return 'Feet is Required';
        } else if (int.parse(value) < 2) {
          return 'Please Put in More Than 2 Feet';
        } else if (int.parse(value) >= 9) {
          return 'Please Put in Less Than 9 Feet';
        }
        return null;
      },
      onSaved: (value) {
        _feet = int.parse(value);
      },
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
    );
  }

  Widget _buildInches() {
    return InfoTextInput(
      keyboardType: TextInputType.number,
      labelText: 'Inches',
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (value.isEmpty) {
          return 'Inches is Required';
        } else if (int.parse(value) < 0) {
          return 'Please Put in More Than 0 Inches';
        } else if (int.parse(value) >= 12) {
          return 'Please Put in Less Than 12 Inches';
        }
        return null;
      },
      onSaved: (value) {
        _inches = int.parse(value);
      },
      onFieldSubmitted: (_) {
        _saveAndSubmit();
      },
    );
  }

  void _saveAndSubmit() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    _totalInches = _feet * 12 + _inches;
    SharedPreferencesHelper.setHeight(_totalInches);
    Navigator.of(context).pushNamed(
      '/sixth',
    );
  }

  @override
  Widget build(BuildContext context) {
    return UserInputFormPage(
      formKey: _formKey,
      text: 'What is your height?',
      firstUserInput: _buildFeet(),
      secondUserInput: _buildInches(),
      nextButton: NextButton(
        onPressed: () {
          _saveAndSubmit();
        },
      ),
    );
  }
}
