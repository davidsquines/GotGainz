import 'package:fitness_app/user-information.dart';
import 'package:flutter/material.dart';

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
    return TextFormField(
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
                margin: EdgeInsets.only(right: 16, bottom: 16),
                child: FloatingActionButton(
                  backgroundColor: Colors.lightBlueAccent,
                  heroTag: 'nextButton',
                  shape: CircleBorder(),
                  child: Icon(Icons.arrow_forward),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();
                    print(_firstName);
                    print(_lastName);
                    UserInformation(firstName: _firstName, lastName: _lastName);
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
