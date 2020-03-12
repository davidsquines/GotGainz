import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ActivityLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent, //TODO: Pick a color
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          activityLevel(context),
          //nextButton(context),
        ],
      ),
    );
  }

  Widget activityLevel(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white, //TODO: Pick a color
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'What is you gym experience?',
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
                        '/eighth',
                      );
                    },
                    child: Text('NONE'),
                    shape: RoundedRectangleBorder(),
                    color: Colors.lightBlueAccent, //TODO: Pick a color
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
                        '/seventh',
                      );
                    },
                    child: Text('SOME'),
                    shape: RoundedRectangleBorder(),
                    color: Colors.lightBlueAccent, //TODO: Pick a color
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
                        '/seventh',
                      );
                    },
                    child: Text('EXPERIENCED'),
                    shape: RoundedRectangleBorder(),
                    color: Colors.lightBlueAccent, //TODO: Pick a color
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
