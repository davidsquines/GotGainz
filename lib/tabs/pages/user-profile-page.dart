import 'package:fitness_app/pages/onboarding-builder.dart';
import 'package:fitness_app/ui/alert-dialog.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/services/shared-pref-helper.dart';
//import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auro_avatar/auro_avatar.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  SharedPreferences prefs;

  String _firstName;
  String _lastName;
  String _gender;
  String _motivation;
  String _height;
  String _weight;

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
    SharedPreferencesHelper.getFirstName(prefs).then((firstName) {
      setState(() {
        this._firstName = firstName;
      });
    });
    SharedPreferencesHelper.getLastName(prefs).then((lastName) {
      setState(() {
        this._lastName = lastName;
      });
    });
    SharedPreferencesHelper.getGender(prefs).then((gender) {
      setState(() {
        this._gender = gender;
      });
    });
    SharedPreferencesHelper.getMotivation(prefs).then((motivation) {
      setState(() {
        _motivation = motivation;
      });
    });
    SharedPreferencesHelper.getHeight(prefs).then((height) {
      setState(() {
        _height = height;
      });
    });
    SharedPreferencesHelper.getWeight(prefs).then((weight) {
      setState(() {
        _weight = weight;
      });
    });
  }

  Widget genderIcon() {
    if (_gender == 'Male') {
      return FaIcon(FontAwesomeIcons.mars);
    } else if (_gender == 'Female') {
      return FaIcon(FontAwesomeIcons.venus);
    } else {
      return FaIcon(FontAwesomeIcons.male);
    }
  }

  void alert(BuildContext context) {
    return ShowAlertDialog(
            cancelButtonToggle: true,
            mainButtonText: 'Continue',
            mainButtonOnPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Onboarding()),
                (Route<dynamic> route) => false,
              );
              SharedPreferencesHelper.setOnBoardingStatus(false, prefs);
            },
            alertTitle: 'WARNING',
            alertContent:
                'YOU WILL LOSE ALL DATA. THERE IS NO GOING BACK FROM THIS.')
        .showAlertDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    try {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  alert(context);
                },
                child: Text('Erase All Data'),
                textColor: Colors.white,
              ),
            ],
          ),
          backgroundColor: Colors.blue,
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new InitialNameAvatar(
                      '${_firstName[0]} ${_lastName[0]}',
                      circleAvatar: true,
                      borderColor: Colors.white,
                      borderSize: 4.0,
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.blue,
                      padding: 20.0,
                      textSize: 30.0,
                    ),
                    SizedBox(width: 15.0),
                    Text(
                      '$_firstName $_lastName',
                        style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 1.5,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    genderIcon(),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  _motivation,
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
                    horizontal: 100.0,
                  ),
                  child: ListTile(
                    title: Text(
                      _height,
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 100.0,
                  ),
                  child: ListTile(
                    title: Text(
                      _weight,
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
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
