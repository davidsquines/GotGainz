import 'package:flutter/material.dart';
import 'package:fitness_app/tabs/pages/exercise-page.dart';
import 'package:fitness_app/tabs/pages/timer-page.dart';
import 'package:fitness_app/tabs/pages/progress-page.dart';
import 'package:fitness_app/tabs/pages/user-profile-page.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white, //TODO: Pick a Color
        body: TabBarView(
          children: <Widget>[
            ExercisePage(),
            TimerPage(),
            ProgressPage(),
            UserProfilePage(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.fitness_center,
                size: 26.0,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.alarm,
                size: 26.0,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.trending_up,
                size: 26.0,
              ),
            ),
            Tab(
                icon: Icon(
              Icons.face,
              size: 26.0,
            )),
          ],
          labelPadding: EdgeInsets.all(5.0),
          labelColor: Colors.blue, //TODO: Pick a Color
          unselectedLabelColor: Colors.black12, //TODO: Pick a Color
          indicatorWeight: 0.00001,
        ),
      ),
    );
  }
}
