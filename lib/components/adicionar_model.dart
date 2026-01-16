import '/components/erro_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'adicionar_widget.dart' show AdicionarWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdicionarModel extends FlutterFlowModel<AdicionarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  // Stores action output result for [Custom Action - downloadProjectCode] action in Button widget.
  String? nome;
  // Stores action output result for [Custom Action - checkFolderExistsAction] action in Button widget.
  bool? win;
  // Stores action output result for [Custom Action - checkFolderExistsAction] action in Button widget.
  bool? android;
  // Stores action output result for [Custom Action - checkFolderExistsAction] action in Button widget.
  bool? web;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();
  }
}
