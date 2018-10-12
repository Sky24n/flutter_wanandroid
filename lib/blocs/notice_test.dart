import 'dart:async';

class NoticeTest {
  StreamController ctrl;

  NoticeTest() {
    ctrl = new StreamController<String>();
  }

  static NoticeTest instance = new NoticeTest();

  static NoticeTest getInstance() {
    return instance;
  }

  void dispose() {
    if (ctrl != null) {
      ctrl.close();
    }
  }
}
