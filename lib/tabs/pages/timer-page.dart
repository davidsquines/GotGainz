import 'dart:async';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> with TickerProviderStateMixin {
  TabController _tb;
  int _hour = 0;
  int _minute = 0;
  int _second = 0;
  bool _started = true;
  bool _stopped = true;
  int _timeForTimer = 0;
  String _timeToDisplay = '0';
  bool _checkTimer = true;

  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;
  bool _startedSW = true;
  bool _stoppedSW = true;
  int _timeForTimerSW = 0;
  String _timeToDisplaySW = '0';
  bool _checkTimerSW = true;

  @override
  void initState() {
    _tb = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  void _start() {
    setState(
      () {
        _started = false;
        _stopped = false;
      },
    );

    _timeForTimer = ((_hour * 3600) + (_minute * 60) + _second);

    Timer.periodic(
      Duration(
        seconds: 1,
      ),
      (Timer t) {
        setState(
          () {
            if (_timeForTimer < 1 || _checkTimer == false) {
              t.cancel();
              _checkTimer = true;

              /// resets time limit
              _timeToDisplay = '0';

              ///reset buttons
              _started = true;

              /// problem, timer sets default for SW
              _stopped = true;

              /// default should be 0 fo SW

              /// add pause/reset function
            } else if (_timeForTimer < 10) {
              _timeToDisplay = _timeForTimer.toString().padLeft(2, '0');
              _timeForTimer -= 1;
            } else if (_timeForTimer < 60) {
              _timeToDisplay = _timeForTimer.toString();
              _timeForTimer -= 1;
            } else if (_timeForTimer < 3600) {
              int min = _timeForTimer ~/ 60;
              int sec = _timeForTimer - (60 * min);
              _timeToDisplay =
                  min.toString() + ':' + sec.toString().padLeft(2, '0');
              _timeForTimer -= 1;
            } else {
              int h = _timeForTimer ~/ 3600;
              int t = _timeForTimer - (3600 * h);
              int min = t ~/ 60;
              int sec = t - (60 * min);
              _timeToDisplay = h.toString() +
                  ':' +
                  min.toString() +
                  ':' +
                  sec.toString().padLeft(2, '0');
              _timeForTimer -= 1;
            }
          },
        );
      },
    );
  }

  void _stop() {
    setState(
      () {
        _started = true;
        _stopped = true;
        _checkTimer = false;
      },
    );
  }

  /// add pause function ///////////////////////////////////////////////////////
  void _startSW() {
    setState(
      () {
        _startedSW = false;
        _stoppedSW = false;

        ///reset to 0
        _timeForTimerSW = ((_hours * 3600) + (_minutes * 60) + _seconds);
        Timer.periodic(
          Duration(
            seconds: 1,
          ),
          (Timer sw) {
            setState(
              () {
                if (_checkTimerSW == false) {
                  sw.cancel();
                  _checkTimerSW = true;

                  /// stay at current point when stopped
                  //_timeToDisplaySW = '0';
                } else if (_timeForTimerSW > 0 && _timeForTimerSW < 10) {
                  _timeToDisplaySW = _timeForTimerSW.toString().padLeft(2, '0');
                  _timeForTimerSW += 1;
                } else if (_timeForTimerSW < 60) {
                  _timeToDisplaySW = _timeForTimerSW.toString();
                  _timeForTimerSW += 1;
                } else if (_timeForTimerSW >= 60 && _timeForTimerSW <= 3600) {
                  int min = _timeForTimerSW ~/ 60;
                  int sec = _timeForTimerSW - (60 * min);
                  _timeToDisplaySW =
                      min.toString() + ':' + sec.toString().padLeft(2, '0');
                  _timeForTimerSW += 1;
                } else {
                  int h = _timeForTimerSW ~/ 3600;
                  int t = _timeForTimerSW - (3600 * h);
                  int min = t ~/ 60;
                  int sec = t - (60 * min);
                  _timeToDisplaySW = h.toString() +
                      ':' +
                      min.toString() +
                      ':' +
                      sec.toString().padLeft(2, '0');
                  _timeForTimerSW += 1;
                }
              },
            );
          },
        );
      },
    );
  }

  void _stopSW() {
    setState(
      () {
        _startedSW = true;
        _stoppedSW = true;
        _checkTimerSW = false;
      },
    );
  }

  Widget _timer() {
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
                        initialValue: _hour,
                        minValue: 0,
                        maxValue: 23,
                        listViewWidth: 60.0,
                        onChanged: (val) {
                          setState(() {
                            _hour = val;
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
                        initialValue: _minute,
                        minValue: 0,
                        maxValue: 59,
                        listViewWidth: 60.0,
                        onChanged: (val) {
                          setState(() {
                            _minute = val;
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
                        initialValue: _second,
                        minValue: 0,

                        /// change to 0 + prevent call on 0
                        maxValue: 59,
                        listViewWidth: 60.0,
                        onChanged: (val) {
                          setState(() {
                            _second = val;
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
              _timeToDisplay,
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
                      _started ? _start : null, //if true start, else null
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
                  onPressed: _stopped ? null : _stop,
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _stopWatch() {
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
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              _timeToDisplaySW,
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
                      _startedSW ? _startSW : null, //if true start, else null
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
                  onPressed: _stoppedSW ? null : _stopSW,
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
    try {
      return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            bottom: TabBar(
              indicatorWeight: 2.0,
              indicatorColor: Colors.lightBlueAccent,
              tabs: <Widget>[
                Text('Timer',
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold)),
                Text('StopWatch',
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold)),
              ],
              labelPadding: EdgeInsets.only(
                bottom: 10.0,
              ),
              labelStyle: TextStyle(
                fontSize: 18.0,
              ),
              unselectedLabelColor: Colors.grey[300],
              controller: _tb,
            ),
          ),
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: viewportConstraints.maxHeight - 100.0),
              child: Container(
                child: TabBarView(
                  children: <Widget>[
                    _timer(),
                    _stopWatch(),
                  ],
                  controller: _tb,
                ),
              ),
            ),
          ),
        );
      });
    } catch (e) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
