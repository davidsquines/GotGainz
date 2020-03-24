import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fitness_app/services/shared-pref-helper.dart';

class Name extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NameState();
  }
}

class NameState extends State<Name> {
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();

  String _firstName;
  String _lastName;

  SharedPreferences prefs;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateAndSubmit() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    SharedPreferencesHelper.setFirstName(_firstName);
    SharedPreferencesHelper.setLastName(_lastName);
  }

  Widget _buildFirstName() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(labelText: 'First Name'),
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
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Last Name'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Last Name is Required';
        }
        return null;
      },
      onSaved: (value) {
        _lastName = value.trim();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent, //TODO: Pick a color
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'What is your name?',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              _buildFirstName(),
              _buildLastName(),
              SizedBox(height: 100),
              Container(
                margin: EdgeInsets.only(right: 16, bottom: 14),
                child: FloatingActionButton(
                  backgroundColor: Colors.lightBlueAccent,
                  heroTag: 'nextButton',
                  shape: CircleBorder(),
                  child: Icon(Icons.arrow_forward),
                  onPressed: () {
                    validateAndSubmit();
                    Navigator.of(context).pushNamed(
                      '/third',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
