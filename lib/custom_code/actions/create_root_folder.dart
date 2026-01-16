// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports manuais
import 'dart:io';

Future<String> createRootFolder() async {
  // Caminho fixo
  final String targetPath = 'C:\\FF_Projetos';
  final Directory rootDir = Directory(targetPath);

  try {
    // Verifica se JÁ existe
    if (await rootDir.exists()) {
      return 'A pasta já existe em $targetPath';
    }

    // Se não existe, CRIA
    // recursive: true garante que crie mesmo se houver algum erro de caminho pai
    await rootDir.create(recursive: true);

    return 'Sucesso: Pasta criada em $targetPath';
  } catch (e) {
    return 'Erro ao criar pasta: $e';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
