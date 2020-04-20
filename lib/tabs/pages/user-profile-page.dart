import 'package:fitness_app/pages/onboarding-builder.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/services/shared-pref-helper.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void showAlertDialog(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text('Cancel'),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text('Continue'),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Onboarding()),
          (Route<dynamic> route) => false,
        );
        SharedPreferencesHelper.setOnBoardingStatus(false, prefs);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text('WARNING'),
      content:
          Text('YOU WILL LOSE ALL DATA. THERE IS NO GOING BACK FROM THIS.'),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
                  showAlertDialog(context);
                },
                child: Text('Erase All Data'),
                textColor: Colors.white,
              ),
            ],
          ),
          backgroundColor: Colors.blue,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
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
                  height: 5.0,
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
                        color: Colors.green[900],
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
