import 'package:fitness_app/services/shared-pref-helper.dart';
import 'package:fitness_app/ui/next-button.dart';
import 'package:fitness_app/ui/user-input-form.dart';
import 'package:fitness_app/ui/info-text-input.dart';
import 'package:flutter/material.dart';

class Weight extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WeightState();
  }
}

class WeightState extends State<Weight> {
  int _pounds;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildWeight() {
    return InfoTextInput(
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      labelText: 'Pounds',
      validator: (value) {
        if (value.isEmpty) {
          return 'Weight is Required';
        } else if (int.parse(value) < 30) {
          return 'Please Put in More Than 30 Pounds';
        } else if (int.parse(value) >= 1000) {
          return 'Please Put in Less Than 1000 Pounds';
        }
        return null;
      },
      onSaved: (value) {
        _pounds = int.parse(value);
      },
      onFieldSubmitted: (_) => _saveAndSubmit(),
    );
  }

  void _saveAndSubmit() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    SharedPreferencesHelper.setWeight(_pounds);
    Navigator.of(context).pushNamed(
      '/seventh',
    );
  }

  @override
  Widget build(BuildContext context) {
    return UserInputFormPage(
      formKey: _formKey,
      text: 'What is your current weight?',
      firstUserInput: _buildWeight(),
      nextButton: NextButton(
        onPressed: () {
          _saveAndSubmit();
        },
      ),
    );
  }
}
