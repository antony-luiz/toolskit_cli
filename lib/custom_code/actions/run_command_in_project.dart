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

Future<String> runCommandInProject(
    String projectId, String commandToRun) async {
  // 1. Validações
  if (projectId.isEmpty) return 'Erro: ID do projeto vazio.';
  if (commandToRun.isEmpty) return 'Erro: Comando vazio.';

  // 2. Definir o caminho onde o comando vai rodar
  final String basePath = 'C:\\FF_Projetos';
  final String targetPath = p.join(basePath, projectId);
  final Directory projectDir = Directory(targetPath);

  // Verifica se a pasta existe
  if (!await projectDir.exists()) {
    return 'Erro: A pasta do projeto não existe em $targetPath';
  }

  try {
    // 3. Executar o comando
    // workingDirectory: É o segredo. Ele diz para o comando rodar DENTRO da pasta.

    final processResult = await Process.run(
      'powershell',
      ['-Command', commandToRun],
      workingDirectory: targetPath, // Aqui definimos onde ele executa
      runInShell: true,
    );

    // 4. Retornar o Log Cru (Resposta + Erros)
    return processResult.stdout.toString() + processResult.stderr.toString();
  } catch (e) {
    return 'Erro ao executar comando: $e';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
