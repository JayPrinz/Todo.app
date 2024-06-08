import '/flutter_flow/flutter_flow_util.dart';
import 'notes_edit_widget.dart' show NotesEditWidget;
import 'package:flutter/material.dart';

class NotesEditModel extends FlutterFlowModel<NotesEditWidget> {
  ///  Local state fields for this page.

  bool editing = false;

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
