import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'package:fitness_app/services/shared-pref-helper.dart';
import 'package:fitness_app/tabs/tabs.dart';
import 'package:fitness_app/services/onboarding-page-helper.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentPageValue = 0;
  int previousPageValue = 0;
  PageController controller;
  SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  void _init() async {
    prefs = await SharedPreferences.getInstance();
    controller = PageController(initialPage: currentPageValue);
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Build UI and functions to save choice
    final List<Widget> onboardingWidgetsList = <Widget>[
      OnboardingPageHelper.gender(),
      OnboardingPageHelper.motivation(),
      OnboardingPageHelper.attention(),
      OnboardingPageHelper.name(),
      OnboardingPageHelper.birthday(),
      OnboardingPageHelper.height(),
      OnboardingPageHelper.weight(),
      OnboardingPageHelper.activityLevel(),
      OnboardingPageHelper.planOutput(),
    ];

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              PageView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: onboardingWidgetsList.length,
                onPageChanged: (int page) {
                  getChangedPageAndMoveBar(page);
                },
                controller: controller,
                itemBuilder: (context, index) {
                  return onboardingWidgetsList[index];
                },
              ),
              Stack(
                //this shows the progress bar
                alignment: AlignmentDirectional.topStart,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 35),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < onboardingWidgetsList.length; i++)
                          if (i == currentPageValue)
                            progressBar(true)
                          else
                            progressBar(false),
                      ],
                    ),
                  ),
                ],
              ),
              Visibility(
                //this shows the final next button
                visible: currentPageValue == onboardingWidgetsList.length - 1
                    ? true
                    : false,
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Container(
                    margin: EdgeInsets.only(right: 16, bottom: 16),
                    child: FloatingActionButton(
                      onPressed: () {
                        SharedPreferencesHelper.setOnBoardingStatus(
                            true, prefs);
                        Route route =
                            MaterialPageRoute(builder: (context) => Tabs());
                        Navigator.pushReplacement(context, route);
                      },
                      shape: CircleBorder(),
                      child: Icon(Icons.arrow_forward),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

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

  void pages() {}
}
