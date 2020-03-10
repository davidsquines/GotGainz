import 'package:flutter/material.dart';

//TODO: May have to remove static if these Widgets do something
//TODO: May have to completely remove these and put it into onboarding.dart

class OnboardingPageHelper {
  static Widget gender() {
    return Scaffold(
      body: Center(
          child: RaisedButton(
            child: Text("Female"),
            color: Colors.lightBlueAccent,
            textColor: Colors.greenAccent,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            splashColor: Colors.amber,
            //onPressed:
          )
      ),
    );
  }

  static Widget motivation() {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
        },
        label: Text('What motivates you the most?'),
          backgroundColor: Colors.pink
      ),
    );
  }

  static Widget attention() {
    return Scaffold(
      body: Center(
        child: Text('Which Areas Need the Most Attention?'),
      ),
    );
  }

  static Widget name() {
    return Scaffold(
      body: Center(
        child: Text('What\'s Your Name?'),
      ),
    );
  }

  static Widget birthday() {
    return Scaffold(
      body: Center(
        child: Text('When Were You Born?'),
      ),
    );
  }

  static Widget height() {
    return Scaffold(
      body: Center(
        child: Text('How Tall Are You?'),
      ),
    );
  }

  static Widget weight() {

  }

  static Widget activityLevel() {
    return Scaffold(
      body: Center(
        child: Text('What\'s Your Current Activity Level?'),
      ),
    );
  }

  static Widget planOutput() {
    return Scaffold(
      body: Center(
        child: Text('Here\'s Your Plan'),
      ),
    );
  }
}
