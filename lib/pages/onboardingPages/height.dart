import 'package:fitness_app/services/shared-pref-helper.dart';
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
    return TextFormField(
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(labelText: 'Feet'),
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
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Inches'),
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
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    'What is your height?',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  _buildFeet(),
                  _buildInches(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minWidth: 30.0,
                      height: 48.0,
                      color: Colors.lightBlueAccent,
                      textColor: Colors.white,
                      child: Icon(Icons.arrow_forward),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        _totalInches = _feet * 12 + _inches;
                        SharedPreferencesHelper.setHeight(_totalInches);
                        Navigator.of(context).pushNamed(
                          '/sixth',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
