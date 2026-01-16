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

Future<String> downloadProjectCode(String commandString) async {
  // 1. Validação simples
  if (commandString.isEmpty) return '1';

  // 2. Caminho Base
  final String basePath = 'C:\\FF_Projetos';
  final Directory baseDir = Directory(basePath);

  // Garante que a raiz existe
  if (!await baseDir.exists()) {
    await baseDir.create(recursive: true);
  }

  try {
    // 3. SNAPSHOT "ANTES": Lista as pastas que já existem
    Set<String> existingFolders = {};
    await for (var entity in baseDir.list(recursive: false)) {
      if (entity is Directory) {
        existingFolders.add(p.basename(entity.path));
      }
    }

    // 4. Executar o comando
    // Apontamos para a raiz. O CLI vai criar a pasta com o nome do projeto lá dentro.
    String finalCommand = '$commandString --dest "$basePath"';

    final processResult = await Process.run(
      'powershell',
      ['-Command', finalCommand],
      runInShell: true,
    );

    // 5. Verificação de Segurança (Opcional, mas bom pra evitar falsos positivos)
    // Se o CLI retornar erro crítico, já paramos.
    // Mas vamos confiar na checagem de pastas como prova final.

    // 6. SNAPSHOT "DEPOIS": Procura a nova pasta
    String? createdFolderName;

    await for (var entity in baseDir.list(recursive: false)) {
      if (entity is Directory) {
        String currentName = p.basename(entity.path);

        // Se essa pasta NÃO estava na lista de antes, ela é a nova!
        if (!existingFolders.contains(currentName)) {
          createdFolderName = currentName;
          break; // Achamos!
        }
      }
    }

    // 7. Resultado Final
    if (createdFolderName != null) {
      // Sucesso: Retorna o nome real da pasta criada (ex: "toolskit_cli")
      return createdFolderName;
    } else {
      // FALHA ou JÁ EXISTIA:
      // Se a pasta já existia, ela estava na lista 'existingFolders',
      // então não foi detectada como nova. Retorna '1' conforme seu pedido.
      return '1';
    }
  } catch (e) {
    return '1';
  }
}

// Função auxiliar não é mais necessária pois usamos listagem direta
