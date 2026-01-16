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

Future<String> openTerminalInRoot(String commandToRun) async {
  // 1. Validação (Não precisamos mais validar ID, só o comando)
  if (commandToRun.isEmpty) return 'Erro: Comando vazio.';

  // 2. Definir a Raiz como Alvo
  final String targetPath = 'C:\\FF_Projetos';
  final Directory projectDir = Directory(targetPath);

  // Se a pasta raiz não existir, cria ela para não dar erro
  if (!await projectDir.exists()) {
    await projectDir.create(recursive: true);
  }

  try {
    // 3. CRIAR O ARQUIVO .BAT NA RAIZ
    // Nome do arquivo fixo, pois é na raiz
    final File batFile = File(p.join(targetPath, 'executar_cmd_root.bat'));

    String batContent = '''
@echo off
color 0A
cd /d "$targetPath"
title Terminal Raiz (FF_Projetos)
echo ---------------------------------------------------
echo Local: Pasta Raiz (FF_Projetos)
echo Executando: $commandToRun
echo ---------------------------------------------------
echo.
call $commandToRun
echo.
echo ---------------------------------------------------
cmd /k
''';

    await batFile.writeAsString(batContent);

    // 4. EXECUTAR VIA EXPLORER
    await Process.run(
      'explorer',
      [batFile.path],
      runInShell: true,
    );

    return 'Sucesso: Terminal aberto na pasta Projetos.';
  } catch (e) {
    return 'Erro ao iniciar: $e';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
