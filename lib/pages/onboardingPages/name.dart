import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fitness_app/services/shared-pref-helper.dart';
import 'package:fitness_app/ui/next-button.dart';
import 'package:fitness_app/ui/user-input-form.dart';
import 'package:fitness_app/ui/info-text-input.dart';

class Name extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NameState();
  }
}

class NameState extends State<Name> {
  String _firstName;
  String _lastName;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFirstName() {
    return InfoTextInput(
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.next,
      labelText: 'First Name',
      validator: (value) {
        if (value.isEmpty) {
          return 'First Name is Required';
        }
        return null;
      },
      onSaved: (value) {
        _firstName = value.trim();
      },
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
    );
  }

  Widget _buildLastName() {
    return InfoTextInput(
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.done,
      labelText: 'Last Name',
      validator: (value) {
        if (value.isEmpty) {
          return 'Last Name is Required';
        }
        return null;
      },
      onSaved: (value) {
        _lastName = value.trim();
      },
      onFieldSubmitted: (_) {
        _saveAndSubmit();
      },
    );
  }

  /*Widget _getInitials() {
    return InfoTextInput(
          private void printInitials(String name) {
          String[] nameParts = name.split(" ");
          String firstName = nameParts[0];
          char firstNameChar = firstName.charAt(0);
            if (nameParts.length > 1) {
                System.out.println("First character of first name: " + firstNameChar);
          String lastName = nameParts[nameParts.length - 1];
          char lastNameChar = lastName.charAt(0);
          System.out.println("First character of last name: " + lastNameChar);
            }
            else {
                System.out.println("First character name: " + firstNameChar);
            }

    );
}*/

  void _saveAndSubmit() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    SharedPreferencesHelper.setFirstName(_firstName);
    SharedPreferencesHelper.setLastName(_lastName);
    Navigator.of(context).pushNamed(
      '/third',
    );
  }

  @override
  Widget build(BuildContext context) {
    return UserInputForm(
      formKey: _formKey,
      text: 'What is your name?',
      firstUserInput: _buildFirstName(),
      secondUserInput: _buildLastName(),
      nextButton: NextButton(
        onPressed: () {
          _saveAndSubmit();
        },
      ),
    );
  }
}
