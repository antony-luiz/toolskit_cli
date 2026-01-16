// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports manuais
import 'dart:io';
import 'package:path/path.dart' as p;

Future<List<String>> getAndCreateProjectsFolder() async {
  // Caminho fixo
  final String targetPath = 'C:\\FF_Projetos';
  final Directory projectsDir = Directory(targetPath);
  List<String> folderNames = [];

  try {
    // 1. Se não existe, cria e retorna lista vazia (limpa)
    if (!await projectsDir.exists()) {
      try {
        await projectsDir.create(recursive: true);
      } catch (e) {
        // Se der erro de permissão, retorna vazio para não quebrar a UI
        return [];
      }
      return [];
    }

    // 2. Se existe, lista as pastas
    await for (var entity
        in projectsDir.list(recursive: false, followLinks: false)) {
      if (entity is Directory) {
        folderNames.add(p.basename(entity.path));
      }
    }

    // Retorna a lista (se estiver vazia, retorna [], se tiver projetos, retorna os nomes)
    return folderNames;
  } catch (e) {
    // Em caso de erro crítico, retorna lista vazia para não travar o app
    return [];
  }
}
