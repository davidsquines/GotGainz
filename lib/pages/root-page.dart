import 'package:fitness_app/services/shared-pref-helper.dart';
import 'package:fitness_app/tabs/tabs.dart';
import 'package:fitness_app/pages/onboarding-builder.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  //this function checks to see if it is a first time user, if first time then go to onboarding, if not go to main
  void _initData() async {
    _prefs = await SharedPreferences.getInstance();

    if (SharedPreferencesHelper.getOnBoardingStatus(_prefs) == true) {
      Route route = MaterialPageRoute(
        builder: (context) => Tabs(),
      );
      Navigator.pushReplacement(context, route);
    } else {
      Route route = MaterialPageRoute(
        builder: (context) => Onboarding(),
      );
      Navigator.pushReplacement(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
