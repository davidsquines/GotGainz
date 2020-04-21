import 'package:fitness_app/services/shared-pref-helper.dart';
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
    return TextFormField(
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(labelText: 'Pounds'),
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
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
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
                    'What is your current weight?',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  _buildWeight(),
                  SizedBox(height: 12.0),
                  Container(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      minWidth: 30.0,
                      height: 50.0,
                      color: Colors.lightBlueAccent,
                      textColor: Colors.white,
                      child: Icon(Icons.arrow_forward),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        SharedPreferencesHelper.setWeight(_pounds);
                        Navigator.of(context).pushNamed(
                          '/seventh',
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
