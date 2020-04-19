import 'package:fitness_app/services/shared-pref-helper.dart';
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
        ],
      ),
    );
  }

  Widget activityLevel(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white, //TODO: Pick a color
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'What is your current activity level?',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: () {
                      SharedPreferencesHelper.setExperience(0);
                      Navigator.of(context).pushNamed(
                        '/eighth',
                      );
                    },
                    child: Text('Lightly Active'),
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
                      SharedPreferencesHelper.setExperience(1);
                      Navigator.of(context).pushNamed(
                        '/eighth',
                      );
                    },
                    child: Text('Moderately Active'),
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
                      SharedPreferencesHelper.setExperience(2);
                      Navigator.of(context).pushNamed(
                        '/eighth',
                      );
                    },
                    child: Text('Very Active'),
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
