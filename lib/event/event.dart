import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/blocs/bloc_index.dart';

class StatusEvent {
  String labelId;
  int status;
  int cid;

  StatusEvent(this.labelId, this.status, {this.cid});
}

class ComEvent {
  int id;
  Object data;

  ComEvent({
    this.id,
    this.data,
  });
}

class Event {
  static void sendAppComEvent(BuildContext context, ComEvent event) {
    // BlocProvider.of<ApplicationBloc>(context).sendAppComEvent(event);
  }

  static void sendAppEvent(BuildContext context, int id) {
    BlocProvider.of<ApplicationBloc>(context).sendAppEvent(id);
  }
}
