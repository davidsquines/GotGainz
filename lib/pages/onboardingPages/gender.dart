import 'package:fitness_app/user-information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        ],
      ),
    );
  }

  Widget gender(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                  //male button
                  minWidth: 200.0,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: () {
                      UserInformation(gender: 1); //stores gender as male
                      Navigator.of(context).pushNamed(
                        '/fourth',
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
                  //female button
                  minWidth: 200.0,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: () {
                      UserInformation(gender: 2); //stores gender as female
                      Navigator.of(context).pushNamed(
                        '/fourth',
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
