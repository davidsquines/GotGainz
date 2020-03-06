//import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fitness_app/services/shared-pref-helper.dart';
import 'package:fitness_app/tabs/tabs.dart';
import 'package:fitness_app/pages/onboarding.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  //this function checks to see if it is a first time user, if first time then go to onboarding, if not go to main
  void _loadSettings() async {
    prefs = await SharedPreferences.getInstance();
/*    Future.delayed(
      Duration(seconds: 2),
      () {*/
    if (SharedPreferencesHelper.getOnBoardingStatus(prefs) == true) {
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
    /*    },
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), //TODO: Give this some design maybe
      ),
    );
  }
}
