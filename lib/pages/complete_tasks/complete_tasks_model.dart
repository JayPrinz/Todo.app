import '/flutter_flow/flutter_flow_util.dart';
import 'complete_tasks_widget.dart' show CompleteTasksWidget;
import 'package:flutter/material.dart';

class CompleteTasksModel extends FlutterFlowModel<CompleteTasksWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
