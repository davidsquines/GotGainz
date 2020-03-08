import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
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
        backgroundColor: Colors.yellow, //TODO: Pick a color
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Text(
                'What is your name?',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 200.0, 30.0, 0.0),
                child: TextFormField(
                  maxLines: 1,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'NAME',
                    //TODO: Implement an onSaved trim function and validator
                    //TODO: Something is wrong with keyboard, needs fix
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 16, bottom: 16),
                child: FloatingActionButton(
                  backgroundColor: Colors.deepOrange, //TODO: Pick a color
                  heroTag: 'nextButton',
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      '/fourth',
                    );
                  },
                  shape: CircleBorder(),
                  child: Icon(Icons.arrow_forward),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
