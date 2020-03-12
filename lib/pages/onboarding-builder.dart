import 'package:fitness_app/services/onboarding-routes.dart';

import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
/*Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Container(
                  margin: EdgeInsets.only(right: 16, bottom: 16),
                  child: FloatingActionButton(
                    onPressed: () {
                      SharedPreferencesHelper.setOnBoardingStatus(true, prefs);
                      Route route = MaterialPageRoute(
                          builder: (context) =>
                              Gender()); //TODO: Change this if needed
                      Navigator.pushReplacement(context, route);
                    },
                    shape: CircleBorder(),
                    child: Icon(Icons.arrow_forward),
                  ),
                ),
              ),

              Stack(
                //this shows the progress bar
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 35),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0;
                            i < 9;
                            i++) //TODO: Change the hardcoded number
                          if (i == currentPageValue)
                            progressBar(true)
                          else
                            progressBar(false),
                      ],
                    ),
                  ),
                ],
              ),


  Widget progressBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.orange : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  void getChangedPageAndMoveBar(int page) {
    currentPageValue = page;

    if (previousPageValue == 0) {
      previousPageValue = currentPageValue;
    } else {
      if (previousPageValue < currentPageValue) {
        previousPageValue = currentPageValue;
      } else {
        previousPageValue = currentPageValue;
      }
    }

    setState(() {});
  }
}

*/
