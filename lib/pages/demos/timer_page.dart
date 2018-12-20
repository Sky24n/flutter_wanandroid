import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  final String title;

  TimerPage(this.title);

  @override
  State<StatefulWidget> createState() {
    return new _TimerPageState();
  }
}

class _TimerPageState extends State<TimerPage> {
  TimerUtil mTimerUtil;
  TimerUtil mCountDownTimerUtil;

  int mTick = 0;
  String timerBtnTxt = "Start";

  int mCountDownTick = 0;
  String countDownBtnTxt = "Start";

  @override
  void initState() {
    super.initState();
    mTimerUtil = new TimerUtil(mInterval: 1000);
    //mTimerUtil.setInterval(1000);
    mTimerUtil.setOnTimerTickCallback((int tick) {
      setState(() {
        mTick = tick;
      });
    });

    mCountDownTimerUtil = new TimerUtil(mInterval: 1000, mTotalTime: 6 * 1000);
//    mCountDownTimerUtil.setInterval(1000);
//    mCountDownTimerUtil.setTotalTime(6 * 1000);
    mCountDownTimerUtil.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      if (_tick.toInt() == 0) {
        countDownBtnTxt = "Start";
        mCountDownTimerUtil.setTotalTime(6 * 1000);
      }
      setState(() {
        mCountDownTick = _tick.toInt();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (mTimerUtil != null) mTimerUtil.cancel();
    if (mCountDownTimerUtil != null) mCountDownTimerUtil.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
      ),
      body: new Column(
        children: <Widget>[
          new Card(
              elevation: 4.0,
              margin: const EdgeInsets.all(10.0),
              child: new Container(
                alignment: Alignment.center,
                child: new Column(
                  children: <Widget>[
                    new Container(
                      color: Colors.grey[50],
                      height: 100.0,
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            width: 100.0,
                            height: 100.0,
                            color: Colors.grey[100],
                            alignment: Alignment.center,
                            child: new Text("Timer"),
                          ),
                          new Expanded(
                            child: new Container(
                              alignment: Alignment.center,
                              child: new Text('$mTick'),
                            ),
                            flex: 1,
                          ),
                          new InkWell(
                              child: new Container(
                                width: 100.0,
                                height: 100.0,
                                color: Colors.grey[100],
                                alignment: Alignment.center,
                                child: new Text("$timerBtnTxt"),
                              ),
                              onTap: () {
                                if (mTimerUtil.isActive()) {
                                  mTick = 0;
                                  mTimerUtil.cancel();
                                  timerBtnTxt = "Start";
                                } else {
                                  mTimerUtil.startTimer();
                                  timerBtnTxt = "Stop";
                                }
                                setState(() {});
                              })
                        ],
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      color: Colors.grey[50],
                      height: 100.0,
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            width: 100.0,
                            height: 100.0,
                            color: Colors.grey[100],
                            alignment: Alignment.center,
                            child: new Text("CountDown"),
                          ),
                          new Expanded(
                            child: new Container(
                              alignment: Alignment.center,
                              child: new Text('$mCountDownTick'),
                            ),
                            flex: 1,
                          ),
                          new InkWell(
                              child: new Container(
                                width: 100.0,
                                height: 100.0,
                                color: Colors.grey[100],
                                alignment: Alignment.center,
                                child: new Text("$countDownBtnTxt"),
                              ),
                              onTap: () {
                                if (mCountDownTimerUtil.isActive()) {
                                  mCountDownTimerUtil.cancel();
                                  countDownBtnTxt = "Start";
                                } else {
                                  mCountDownTimerUtil.startCountDown();
                                  countDownBtnTxt = "Stop";
                                }
                                setState(() {});
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
