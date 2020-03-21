import 'package:fitness_app/user-information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Motivation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent, //TODO: Pick a color
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          motivation(context),
        ],
      ),
    );
  }

  Widget motivation(BuildContext context) {
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
                  'What is your motivation?',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                ButtonTheme(
                  //gain strength button
                  minWidth: 200.0,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: () {
                      UserInformation set = UserInformation(
                          motivation: 1); //store as gain strength

                      Navigator.of(context).pushNamed(
                        '/fifth',
                      );
                      print(set.getGender());
                    },
                    child: Text('TO GAIN STRENGTH'),
                    shape: RoundedRectangleBorder(),
                    color: Colors.lightBlueAccent, //TODO: Pick a color
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ButtonTheme(
                  //lose weight button
                  minWidth: 200.0,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: () {
                      UserInformation(motivation: 2);
                      Navigator.of(context).pushNamed(
                        '/fifth',
                      );
                    },
                    child: Text('TO LOSE WEIGHT'),
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
