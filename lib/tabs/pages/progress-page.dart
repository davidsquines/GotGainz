import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fitness_app/services/shared-pref-helper.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  SharedPreferences prefs;

  String _motivation;

  int _level;
  int _currentProgress;
  int _progressToLevelUp;

  int _chestLevel;
  int _backLevel;
  int _armsLevel;
  int _shouldersLevel;
  int _legsLevel;
  int _strengthLevel;
  int _calorieLevel;

  @override
  void initState() {
    super.initState();
    _init();
    setData();
  }

  void _init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void setData() async {
    SharedPreferencesHelper.getMotivation(prefs).then((motivation) {
      setState(() {
        _motivation = motivation;
      });
    });
    SharedPreferencesHelper.getUserLevel(prefs).then((level) {
      setState(() {
        this._level = level;
      });
    });
    SharedPreferencesHelper.getCurrentProgress(prefs).then((progress) {
      setState(() {
        this._currentProgress = progress;
      });
    });
    SharedPreferencesHelper.getProgressToLevelUp(prefs)
        .then((progressToLevelUp) {
      setState(() {
        this._progressToLevelUp = progressToLevelUp;
      });
    });
    SharedPreferencesHelper.getChestLevel(prefs).then((chestLevel) {
      setState(() {
        this._chestLevel = chestLevel;
      });
    });
    SharedPreferencesHelper.getBackLevel(prefs).then((backLevel) {
      setState(() {
        this._backLevel = backLevel;
      });
    });
    SharedPreferencesHelper.getArmsLevel(prefs).then((armsLevel) {
      setState(() {
        this._armsLevel = armsLevel;
      });
    });
    SharedPreferencesHelper.getShouldersLevel(prefs).then((shouldersLevel) {
      setState(() {
        this._shouldersLevel = shouldersLevel;
      });
    });
    SharedPreferencesHelper.getLegsLevel(prefs).then((legsLevel) {
      setState(() {
        this._legsLevel = legsLevel;
      });
    });
    SharedPreferencesHelper.getStrengthLevel(prefs).then((strengthLevel) {
      setState(() {
        this._strengthLevel = strengthLevel;
      });
    });
    SharedPreferencesHelper.getCalorieLevel(prefs).then((calorieLevel) {
      setState(() {
        this._calorieLevel = calorieLevel;
      });
    });

//    if(_level >= 2){
//      showAlertDialog(context);
//    }
//
//    if(_currentProgress >= 2){
//      showAlertDialog(context);
//    }
//
//    if(_progressToLevelUp >= 2){
//      showAlertDialog(context);
//    }
//
//    if(_strengthLevel >= 2){
//      showAlertDialog(context);
//    }
//
//    if(_calorieLevel >= 2){
//      showAlertDialog(context);
//    }

    ///

//    if(_chestLevel >= 2){
//      showAlertDialog(context);
//    }
//
//    if(_legsLevel >= 2){
//      showAlertDialog(context);
//    }
//
//    if(_shouldersLevel >= 2){
//      showAlertDialog(context);
//    }
//
//    if(_backLevel >= 2){
//      showAlertDialog(context);
//    }
//
//    if(_armsLevel >= 2){
//      showAlertDialog(context);
//    }
  }

  ///set all values to 2
  ///don't display messages after they have been closed

  void showAlertDialog(BuildContext context) {
    Widget closeButton = FlatButton(
      child: Text('Close'),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
//    Widget continueButton = FlatButton(
//      child: Text('Continue'),
//      onPressed: () {
//        Navigator.of(context, rootNavigator: true).pop();
//        Navigator.pop(context);
//      },
//    );
    if (_chestLevel % 2 == 0) {
      AlertDialog alert = AlertDialog(
        title: Text('Congratulations'),
        content: Text('You have completed this chest workout!'),
        actions: [
          closeButton,
          // continueButton,
        ],
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    if (_backLevel % 2 == 0) {
      AlertDialog alert = AlertDialog(
        title: Text('Congratulations'),
        content: Text('You have completed this back workout!'),
        actions: [
          closeButton,
          // continueButton,
        ],
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    if (_armsLevel % 2 == 0) {
      AlertDialog alert = AlertDialog(
        title: Text('Congratulations'),
        content: Text('You have completed this arm workout!'),
        actions: [
          closeButton,
          // continueButton,
        ],
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    if (_shouldersLevel % 2 == 0) {
      AlertDialog alert = AlertDialog(
        title: Text('Congratulations'),
        content: Text('You have completed this shoulder workout!'),
        actions: [
          closeButton,
          // continueButton,
        ],
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    if (_legsLevel % 2 == 0) {
      AlertDialog alert = AlertDialog(
        title: Text('Congratulations'),
        content: Text('You have completed this leg workout!'),
        actions: [
          closeButton,
          // continueButton,
        ],
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    if (_strengthLevel % 2 == 0) {
      AlertDialog alert = AlertDialog(
        title: Text('Nicely Done!'),
        content: Text("You're getting stronger!"),
        actions: [
          closeButton,
          // continueButton,
        ],
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    if (_calorieLevel % 2 == 0) {
      AlertDialog alert = AlertDialog(
        title: Text('Nice Job!'),
        content: Text("You're losing weight\n"
            "Keep up the good work"),
        actions: [
          closeButton,
          // continueButton,
        ],
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }

  ///alert dialog?
  //strength - you're getting stronger
  // calorie - you're losing weight
  // progress to level ==3

  @override
  Widget build(BuildContext context) {
    try {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
         child: SingleChildScrollView(
            child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Expanded(
                 //   flex: 6
                    Image(
                      image: AssetImage('assets/progresspage.png'),
                    ),
                  Text('Workout Goal: $_motivation',
                      style: TextStyle(color: Colors.black, fontSize: 18.0)),
                  Text('\nCurrent Level: $_level ',
                      style: TextStyle(color: Colors.blue, fontSize: 16.0)),
                  Text('\nCurrent Week Progress: $_currentProgress ',
                      style: TextStyle(color: Colors.blue, fontSize: 16.0)),
                  Text(
                      '\nWeeks Left Until Level Up: ${2 - _progressToLevelUp} ',
                      style: TextStyle(color: Colors.blue, fontSize: 16.0)),
                  Text('\nChest Level: $_chestLevel ',
                      style: TextStyle(color: Colors.blue, fontSize: 15.0)),
                  Text('\nBack Level: $_backLevel ',
                      style: TextStyle(color: Colors.blue, fontSize: 15.0)),
                  Text('\nArms Level: $_armsLevel ',
                      style: TextStyle(color: Colors.blue, fontSize: 15.0)),
                  Text('\nShoulders  Level: $_shouldersLevel ',
                      style: TextStyle(color: Colors.blue, fontSize: 15.0)),
                  Text('\nLegs Level: $_legsLevel ',
                      style: TextStyle(color: Colors.blue, fontSize: 15.0)),
                  Text('\nStrength Level: $_strengthLevel ',
                      style: TextStyle(color: Colors.blue, fontSize: 15.0)),
                  Text(
                    '\nWeight-Loss Level: $_calorieLevel',
                    style: TextStyle(color: Colors.blue, fontSize: 15.0),
                  ),

              //  ),
               // Expanded(
                 // flex: 1,
                   MaterialButton(
                    minWidth: double.infinity,
                    height: 50.0,
                    onPressed: () {
                      if (_armsLevel % 2 == 0||
                          _chestLevel % 2 == 0 ||
                          _backLevel % 2 == 0 ||
                          _shouldersLevel % 2 == 0 ||
                          _legsLevel % 2 == 0 ||
                          _strengthLevel % 2 == 0 ||
                          _calorieLevel % 2 == 0) {
                        showAlertDialog(context);
                        //  displayResults();
                      } else {
                        return null;
                      }
                    },
                    child: Text(
                      "View Progress",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
               // ),
              ],
            ),
          ),
        ),
          ),
        ),
      );

      //   ),
      //       ),
      //       ),
      //     );
    } catch (e) {
      if (e != null) {
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return null;
      }
    }
  }
}

//@override
//Widget build(BuildContext context) {
//  try {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: Scaffold(
//        backgroundColor: Colors.white,
//        body: SafeArea(
//          child: SingleChildScrollView(
//            child: Center(
//              child: Column(
//                children: <Widget>[
//                  Image(
//                    image: AssetImage('assets/progresspage.png'),
//                  ),
//                  Text('Workout Goal: $_motivation',
//                      style: TextStyle(color: Colors.black, fontSize: 18.0)),
//                  Text('\nCurrent Level: $_level ',
//                      style: TextStyle(color: Colors.blue, fontSize: 16.0)),
//                  Text('\nCurrent Week Progress: $_currentProgress ',
//                      style: TextStyle(color: Colors.blue, fontSize: 16.0)),
//                  Text(
//                      '\nWeeks Left Until Level Up: ${2 - _progressToLevelUp} ',
//                      style: TextStyle(color: Colors.blue, fontSize: 16.0)),
//                  Text('\nChest Level: $_chestLevel ',
//                      style: TextStyle(color: Colors.blue, fontSize: 15.0)),
//                  Text('\nBack Level: $_backLevel ',
//                      style: TextStyle(color: Colors.blue, fontSize: 15.0)),
//                  Text('\nArms Level: $_armsLevel ',
//                      style: TextStyle(color: Colors.blue, fontSize: 15.0)),
//                  Text('\nShoulders  Level: $_shouldersLevel ',
//                      style: TextStyle(color: Colors.blue, fontSize: 15.0)),
//                  Text('\nLegs Level: $_legsLevel ',
//                      style: TextStyle(color: Colors.blue, fontSize: 15.0)),
//                  Text('\nStrength Level: $_strengthLevel ',
//                      style: TextStyle(color: Colors.blue, fontSize: 15.0)),
//                  Text(
//                    '\nWeight-Loss Level: $_calorieLevel',
//                    style: TextStyle(color: Colors.blue, fontSize: 15.0),
//                  ),
//                ],
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  } catch (e) {
//    if (e != null) {
//      return Container(
//        child: Center(
//          child: CircularProgressIndicator(),
//        ),
//      );
//    } else {
//      return null;
//    }
//  }
//}
//}