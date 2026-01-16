import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'visualizar_widget.dart' show VisualizarWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VisualizarModel extends FlutterFlowModel<VisualizarWidget> {
  ///  Local state fields for this page.

  String? log;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkFolderExistsAction] action in visualizar widget.
  bool? win;
  // Stores action output result for [Custom Action - checkFolderExistsAction] action in visualizar widget.
  bool? web;
  // Stores action output result for [Custom Action - checkFolderExistsAction] action in visualizar widget.
  bool? android;
  // Stores action output result for [Custom Action - downloadProjectCodeLOG] action in Button widget.
  String? logg;
  // Stores action output result for [Custom Action - runCommandInProject] action in Button widget.
  String? log1;
  // Stores action output result for [Custom Action - runCommandInProject] action in Button widget.
  String? log2;
  // Stores action output result for [Custom Action - runCommandInProject] action in Button widget.
  String? log3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
