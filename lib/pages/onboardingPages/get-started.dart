import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(25, 100, 25, 25),
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/getStartedImage.png'),
                    width: 380.0,
                    height: 360.0,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    'Welcome to Got Gainz',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.orange[800],
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Your personal fitness trainer is waiting for you.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'A few things before you start working out.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.deepOrange),
                    ),
                    minWidth: 30.0,
                    height: 50.0,
                    color: Colors.orange[700],
                    textColor: Colors.white,
                    child: Text(
                      'Get Started'.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/second',
                      );
                    },
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
