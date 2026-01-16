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

Future<String> openProjectFolder(String projectId, String subPath) async {
  // 1. Validação básica
  if (projectId.isEmpty) {
    return 'Erro: ID do projeto não informado.';
  }

  // 2. Montar o Caminho Completo
  // Base: C:\FF_Projetos
  // Resultado: C:\FF_Projetos\{projectId}\{subPath}
  final String basePath = 'C:\\FF_Projetos';
  final String fullPath = p.join(basePath, projectId, subPath);

  final Directory targetDir = Directory(fullPath);

  // 3. Verificar se a pasta existe antes de tentar abrir
  if (!await targetDir.exists()) {
    return 'Erro: A pasta não foi encontrada em: $fullPath';
  }

  try {
    // 4. Abrir o Explorador de Arquivos do Windows
    // O comando 'explorer' seguido do caminho abre a janela da pasta.
    await Process.run(
      'explorer',
      [fullPath],
      runInShell: true,
    );

    return 'Sucesso';
  } catch (e) {
    return 'Erro ao abrir pasta: $e';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
