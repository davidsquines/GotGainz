import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          name(context),
          //nextButton(context),
        ],
      ),
    );
  }

  Widget name(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white, //TODO: Pick a color
        body: SafeArea(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'What is your name?',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.30),
                child: RaisedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    var _formKey;
                    /*if (_formKey.currentState.validate()) {*/Navigator.of(context).pushNamed(
                      '/fifth',
                    );
                    /*}*/
                  },
                  child: Text('Submit'),
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}