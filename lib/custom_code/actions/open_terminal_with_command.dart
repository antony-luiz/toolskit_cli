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

Future<String> openTerminalWithCommand(
    String projectId, String commandToRun) async {
  if (projectId.isEmpty) return 'Erro: ID vazio.';
  if (commandToRun.isEmpty) return 'Erro: Comando vazio.';

  final String basePath = 'C:\\FF_Projetos';
  final String targetPath = p.join(basePath, projectId);
  final Directory projectDir = Directory(targetPath);

  if (!await projectDir.exists()) {
    return 'Erro: Pasta do projeto não encontrada.';
  }

  try {
    // 1. CRIAR O ARQUIVO .BAT
    final File batFile = File(p.join(targetPath, 'executar_cmd.bat'));

    // A MÁGICA ESTÁ AQUI EMBAIXO:
    // 1. "call": Garante que o comando rode e volte para cá.
    // 2. "cmd /k": Inicia uma nova sessão de CMD e MANTÉM A JANELA ABERTA.

    String batContent = '''
@echo off
color 0A
cd /d "$targetPath"
title Terminal Projeto: $projectId
echo ---------------------------------------------------
echo Projeto: $projectId
echo Executando: $commandToRun
echo ---------------------------------------------------
echo.
call $commandToRun
echo.
echo ---------------------------------------------------
cmd /k
''';

    await batFile.writeAsString(batContent);

    // 2. EXECUTAR VIA EXPLORER (Para usar seu terminal padrão)
    await Process.run(
      'explorer',
      [batFile.path],
      runInShell: true,
    );

    return 'Sucesso: Terminal aberto e aguardando.';
  } catch (e) {
    return 'Erro ao iniciar: $e';
  }
}
