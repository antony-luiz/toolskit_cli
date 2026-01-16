// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Import Manual (Obrigatório)
import 'dart:io';

Future<bool> checkFolderExistsAction(
    String projectId, String folderName) async {
  if (projectId.isEmpty || folderName.isEmpty) return false;

  final String fullPath = 'C:\\FF_Projetos\\$projectId\\$folderName';
  final Directory dir = Directory(fullPath);

  // Retorna true se existir, false se não
  return await dir.exists(); // Usamos await aqui pois Actions são Future
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
