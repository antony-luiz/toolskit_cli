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

Future<String> deleteProjectFolder(String projectId) async {
  // 1. Validação
  if (projectId.isEmpty) {
    return 'Erro: ID do projeto não informado.';
  }

  // 2. Montar o caminho
  final String basePath = 'C:\\FF_Projetos';
  final String targetPath = p.join(basePath, projectId);
  final Directory projectDir = Directory(targetPath);

  // 3. Verificar se existe
  if (!await projectDir.exists()) {
    return 'Erro: A pasta do projeto não existe em $targetPath';
  }

  try {
    // 4. Deletar a pasta
    // recursive: true -> OBRIGATÓRIO para deletar pastas que têm arquivos dentro.
    // Se fosse false, o Windows bloquearia dizendo que a pasta não está vazia.
    await projectDir.delete(recursive: true);

    return 'Sucesso';
  } catch (e) {
    // Erro comum: "File used by another process" (se o terminal ou VS Code estiver aberto nela)
    return 'Erro ao deletar: $e';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
