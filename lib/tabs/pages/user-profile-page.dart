import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'First Name | Last Name',
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 1.5,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Gain Strength | Lose Weight',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal[900],
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  title: Text(
                    'Height',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.green[900],
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  title: Text(
                    'Weight',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.green[900],
                    ),
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
