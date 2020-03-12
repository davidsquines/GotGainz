import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Gender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent, //TODO: Pick a color
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          gender(context),
          //nextButton(context),
        ],
      ),
    );
  }

  Widget gender(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'What is your gender?',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/second',
                      );
                    },
                    child: Text('MALE'),
                    shape: RoundedRectangleBorder(),
                    color: Colors.lightBlueAccent, //TODO: Pick a Color
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/third',
                      );
                    },
                    child: Text('FEMALE'),
                    shape: RoundedRectangleBorder(),
                    color: Colors.lightBlueAccent, //TODO: Pick a Color
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
