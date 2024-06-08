import '/flutter_flow/flutter_flow_util.dart';
import 'add_new_note_widget.dart' show AddNewNoteWidget;
import 'package:flutter/material.dart';

class AddNewNoteModel extends FlutterFlowModel<AddNewNoteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for content widget.
  FocusNode? contentFocusNode;
  TextEditingController? contentTextController;
  String? Function(BuildContext, String?)? contentTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    contentFocusNode?.dispose();
    contentTextController?.dispose();
  }
}
