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
        ],
      ),
    );
  }

  Widget name(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white, //TODO: Pick a color
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'What is your name?',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text.';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.30),
                  child: FlatButton(
                    onPressed: () {
                      //TODO: Validator needs implementing
                      Navigator.of(context).pushNamed(
                        '/fifth',
                      );
                    },
                    shape: CircleBorder(),
                    child: Icon(Icons.arrow_forward),
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
