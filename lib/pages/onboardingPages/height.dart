import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Height extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          height(context),
          //nextButton(context),
        ],
      ),
    );
  }

  Widget height(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'What is your height?',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  margin: EdgeInsets.only(right: 16, bottom: 16),
                  child: FloatingActionButton(
                    backgroundColor: Colors.lightBlueAccent,
                    heroTag: 'nextButton',
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/fifth',
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
      ),
    );
  }
}
