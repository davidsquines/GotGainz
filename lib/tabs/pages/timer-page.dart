import 'dart:async';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TimerPage(),
    );
  }
}
*/

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> with TickerProviderStateMixin {
  TabController tb;
  int hour = 0;
  int minute = 0;
  int second = 0;
  bool started = true;
  bool stopped = true;
  int timeForTimer = 0;
  String timeToDisplay = '0';
  bool checkTimer = true;

  bool reset = true;

  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  bool startedSW = true;
  bool stoppedSW = true;
  int timeForTimerSW = 0;
  String timeToDisplaySW = '0';
  bool checkTimerSW = true;

  bool resetSW = true;

  @override
  void initState() {
    tb = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  void start() {
    setState(() {
      started = false;
      stopped = false;
      reset = false;
    });

    //   if(resetter==false){
    timeForTimer = ((hour * 3600) + (minute * 60) + second);
//    }

//    else{
//      timeForTimer = 0;
//    }
    // debugPrint(timeForTimer.toString());
    Timer.periodic(
        Duration(
          seconds: 1,
        ), (Timer t) {
      setState(() {
        if (timeForTimer < 1 || checkTimer == false) {
          t.cancel();
          checkTimer = true;

          /// resets time limit
          timeToDisplay = '0';

          ///end on 0

//          if(timeForTimer == 0){
//           // debugPrint('stopped by default');
//          }
//          checkTimer = true;

          ///reset buttons
          started = true;

          /// problem, timer sets default for SW
          stopped = true;

          /// default should be 0 fo SW

          /// add pause/reset function
//          Navigator.pushReplacement(context, MaterialPageRoute(
//            builder: (context) => TimerPage(),
//          ));
          //timeToDisplay = timeForTimer.toString();
          // timeToDisplay = '';
        } else if (timeForTimer < 60) {
          timeToDisplay = timeForTimer.toString();
          timeForTimer -= 1;
        } else if (timeForTimer < 3600) {
          int min = timeForTimer ~/ 60;
          int sec = timeForTimer - (60 * min);
          timeToDisplay = min.toString() + ':' + sec.toString();
          timeForTimer -= 1;
        } else {
          int h = timeForTimer ~/ 3600;
          int t = timeForTimer - (3600 * h);
          int min = t ~/ 60;
          int sec = t - (60 * min);
          timeToDisplay =
              h.toString() + ':' + min.toString() + ':' + sec.toString();
          timeForTimer -= 1;
        }

//      else{
//          timeForTimer -= 1;
//        }
//        timeToDisplay = timeForTimer.toString();
      });
    });
  }

  void stop() {
    setState(() {
      started = true;
      stopped = true;
      reset = true;
      checkTimer = false;
    });
  }

//  void reset(){
//    started = true;
//    stopped = true;
//    resetter = true;
//    checkTimer = false;
//  }

  /// add pause function ///////////////////////////////////////////////////////

  void startSW() {
    setState(() {
      startedSW = false;
      stoppedSW = false;

      ///reset to 0
      timeForTimerSW = ((hours * 3600) + (minutes * 60) + seconds);
      Timer.periodic(
          Duration(
            seconds: 1,
          ), (Timer sw) {
        setState(() {
          if (checkTimerSW == false) {
            sw.cancel();
            checkTimerSW = true;

            /// stay at current point when stopped
            timeToDisplaySW = '0';

//            Navigator.pushReplacement(context, MaterialPageRoute(
//              builder: (context) => TimerPage(),
//            ));
            //timeToDisplay = timeForTimer.toString();
            //timeToDisplay = '';
          }

          ///adjust time formatting
          else if (timeForTimerSW > 60) {
            timeToDisplaySW = timeForTimerSW.toString();
            timeForTimerSW += 1;
          } else if (timeForTimerSW > 3600) {
            int min = timeForTimerSW ~/ 60;
            int sec = timeForTimer - (60 * min);
            timeToDisplaySW = min.toString() + ':' + sec.toString();
            timeForTimerSW += 1;
          } else {
            int h = timeForTimerSW ~/ 3600;
            int t = timeForTimerSW - (3600 * h);
            int min = t ~/ 60;
            int sec = t - (60 * min);
            timeToDisplaySW =
                h.toString() + ':' + min.toString() + ':' + sec.toString();
            timeForTimerSW += 1;
          }

//      else{
//          timeForTimer -= 1;
//        }
//        timeToDisplay = timeForTimer.toString();
        });
      });
    });
  }

  void stopSW() {
    setState(() {
      startedSW = true;
      stoppedSW = true;
      checkTimerSW = false;
    });
  }

  Widget timer() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                        'H',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    NumberPicker.integer(
                        initialValue: hour,
                        minValue: 0,
                        maxValue: 23,
                        listViewWidth: 60.0,
                        onChanged: (val) {
                          setState(() {
                            hour = val;
                          });
                        }),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                        'M',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    NumberPicker.integer(
                        initialValue: minute,
                        minValue: 0,
                        maxValue: 59,
                        listViewWidth: 60.0,
                        onChanged: (val) {
                          setState(() {
                            minute = val;
                          });
                        }),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                        'S',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    NumberPicker.integer(
                        initialValue: second,
                        minValue: 0,

                        /// change to 0 + prevent call on 0
                        maxValue: 59,
                        listViewWidth: 60.0,
                        onChanged: (val) {
                          setState(() {
                            second = val;
                          });
                        }),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              timeToDisplay,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: started ? start : null, //if true start, else null
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  color: Colors.green,

                  child: Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                RaisedButton(
                  onPressed: stopped ? null : stop,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  color: Colors.red,
                  child: Text(
                    'Stop',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
//                RaisedButton(
//                  onPressed: resetter ? null : reset,
//                  padding: EdgeInsets.symmetric(
//                    horizontal: 40.0,
//                    vertical: 10.0,
//                  ),
//                  color: Colors.blue ,
//                  child: Text(
//                    'Reset',
//                    style: TextStyle(
//                      fontSize: 18.0,
//                      color:Colors.white,
//                    ),
//                  ),
//                  shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                  ),
//               ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget stopWatch() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                        '',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    // NumberPicker.integer(
//                        initialValue: hour,
//                        minValue: 0,
//                        maxValue: 23,
//                        listViewWidth: 60.0,
//                        onChanged: (val){
//                          setState(() {
//                            hour = val;
//                          });
//                        }
//                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                        '',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
//                    NumberPicker.integer(
//                        initialValue: minute,
//                        minValue: 0,
//                        maxValue: 59,
//                        listViewWidth: 60.0,
//                        onChanged: (val){
//                          setState(() {
//                            minute = val;
//                          });
//                        }
//                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                        '',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
//                    NumberPicker.integer(
//                        initialValue: second,
//                        minValue: 0,
//                        maxValue: 59,
//                        listViewWidth: 60.0,
//                        onChanged: (val){
//                          setState(() {
//                            second = val;
//                          });
//                        }
//                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              timeToDisplaySW,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed:
                      startedSW ? startSW : null, //if true start, else null
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  color: Colors.green,

                  child: Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                RaisedButton(
                  onPressed: stoppedSW ? null : stopSW,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  color: Colors.red,
                  child: Text(
                    'Stop',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
//                  RaisedButton(
//                    onPressed: stopped ? null : stop,
//                    padding: EdgeInsets.symmetric(
//                      horizontal: 40.0,
//                      vertical: 10.0,
//                    ),
//                    color: Colors.blue ,
//                    child: Text(
//                      'Reset',
//                      style: TextStyle(
//                        fontSize: 18.0,
//                        color:Colors.white,
//                      ),
//                    ),
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(15.0),
//                    ),
//                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //widget menu
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: <Widget>[
            Text('Timer',
                style: TextStyle(
                    color: Colors.deepOrange, fontWeight: FontWeight.bold)),
            Text('StopWatch',
                style: TextStyle(
                    color: Colors.deepOrange, fontWeight: FontWeight.bold)),
          ],
          labelPadding: EdgeInsets.only(
            bottom: 10.0,
          ),
          labelStyle: TextStyle(
            fontSize: 18.0,
          ),
          unselectedLabelColor: Colors.grey[300],
          controller: tb,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          timer(),
//          Text(
//            'Timer'
//          ),
          stopWatch(),
        ],
        controller: tb,
      ),
    );
  }
}

/// stopWatch //////////////////////////////////////////////////////////////////

Widget stopWatch() {
  return null;
}
