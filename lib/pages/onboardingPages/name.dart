import 'package:fitness_app/user-information.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/databases/user-info.dart';
import 'package:fitness_app/databases/user-info-helper.dart';

class Name extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NameState();
  }
}

class NameState extends State<Name> {
  final dbHelper = UserInfoDatabaseHelper.instance;

/*  List<UserInfo> lastName = [];
  List<UserInfo> firstName = [];*/

  //controllers used in insert operation UI
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();

  String _firstName;
  String _lastName;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _insertName(lastName, firstName) async {
    // row to insert
    Map<String, dynamic> row = {
      UserInfoDatabaseHelper.columnLastName: lastName,
      UserInfoDatabaseHelper.columnFirstName: firstName,
    };
    UserInfo info = UserInfo.fromMap(row);
    final id = await dbHelper.insert(info);
  }

  Widget _buildFirstName() {
    return TextFormField(
      controller: firstNameController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(labelText: 'First Name'),
      validator: (value) {
        if (value.isEmpty) {
          return 'First Name is Required';
        }
        return null;
      },
      onSaved: (value) {
        _firstName = value.trim();
      },
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      controller: lastNameController,
      decoration: InputDecoration(labelText: 'Last Name'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Last Name is Required';
        }
        return null;
      },
      onSaved: (value) {
        _lastName = value.trim();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent, //TODO: Pick a color
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'What is your name?',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              _buildFirstName(),
              _buildLastName(),
              SizedBox(height: 100),
              Container(
                margin: EdgeInsets.only(right: 16, bottom: 16),
                child: FloatingActionButton(
                  backgroundColor: Colors.lightBlueAccent,
                  heroTag: 'nextButton',
                  shape: CircleBorder(),
                  child: Icon(Icons.arrow_forward),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();
                    _lastName = lastNameController.text;
                    _firstName = firstNameController.text;
                    _insertName(_lastName, _firstName);
                    Navigator.of(context).pushNamed(
                      '/third',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
