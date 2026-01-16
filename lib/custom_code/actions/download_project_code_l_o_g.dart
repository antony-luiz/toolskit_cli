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

Future<String> downloadProjectCodeLOG(String commandString) async {
  // 1. Validação simples
  if (commandString.isEmpty) return '';

  // 2. Configurar a Raiz
  // O CLI vai criar a pasta do projeto automaticamente DENTRO desta pasta.
  final String basePath = 'C:\\FF_Projetos';
  final Directory baseDir = Directory(basePath);

  try {
    // Garante que a raiz C:\FF_Projetos existe
    if (!await baseDir.exists()) {
      await baseDir.create(recursive: true);
    }

    // 3. Montar o comando
    // Adicionamos o destino para a raiz.
    String finalCommand = '$commandString --dest "$basePath"';

    // 4. Executar via POWERSHELL
    final processResult = await Process.run(
      'powershell',
      ['-Command', finalCommand],
      runInShell: true,
    );

    // 5. Retornar a saída Pura (Crua)
    // Combina o log de saída normal (stdout) e o de erros/progresso (stderr)
    // Retorna exatamente o que o terminal cuspiu, sem adicionar [SYSTEM] ou nada mais.
    return processResult.stdout.toString() + processResult.stderr.toString();
  } catch (e) {
    // Retorna apenas o erro técnico se o comando nem conseguir rodar
    return 'Erro de execução: $e';
  }
}
