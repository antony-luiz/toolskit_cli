import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _versao = prefs.getString('ff_versao') ?? _versao;
    });
    _safeInit(() {
      _projetos = prefs.getStringList('ff_projetos') ?? _projetos;
    });
    _safeInit(() {
      _linkprojetos = prefs.getStringList('ff_linkprojetos') ?? _linkprojetos;
    });
    _safeInit(() {
      _WINDOSsuporte = prefs
              .getStringList('ff_WINDOSsuporte')
              ?.map((x) => x == 'true')
              .toList() ??
          _WINDOSsuporte;
    });
    _safeInit(() {
      _androidSUPORTE = prefs
              .getStringList('ff_androidSUPORTE')
              ?.map((x) => x == 'true')
              .toList() ??
          _androidSUPORTE;
    });
    _safeInit(() {
      _webSUPORTE = prefs
              .getStringList('ff_webSUPORTE')
              ?.map((x) => x == 'true')
              .toList() ??
          _webSUPORTE;
    });
    _safeInit(() {
      _inicio = prefs.getBool('ff_inicio') ?? _inicio;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _versao = '0.1';
  String get versao => _versao;
  set versao(String value) {
    _versao = value;
    prefs.setString('ff_versao', value);
  }

  List<String> _projetos = [];
  List<String> get projetos => _projetos;
  set projetos(List<String> value) {
    _projetos = value;
    prefs.setStringList('ff_projetos', value);
  }

  void addToProjetos(String value) {
    projetos.add(value);
    prefs.setStringList('ff_projetos', _projetos);
  }

  void removeFromProjetos(String value) {
    projetos.remove(value);
    prefs.setStringList('ff_projetos', _projetos);
  }

  void removeAtIndexFromProjetos(int index) {
    projetos.removeAt(index);
    prefs.setStringList('ff_projetos', _projetos);
  }

  void updateProjetosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    projetos[index] = updateFn(_projetos[index]);
    prefs.setStringList('ff_projetos', _projetos);
  }

  void insertAtIndexInProjetos(int index, String value) {
    projetos.insert(index, value);
    prefs.setStringList('ff_projetos', _projetos);
  }

  List<String> _linkprojetos = [];
  List<String> get linkprojetos => _linkprojetos;
  set linkprojetos(List<String> value) {
    _linkprojetos = value;
    prefs.setStringList('ff_linkprojetos', value);
  }

  void addToLinkprojetos(String value) {
    linkprojetos.add(value);
    prefs.setStringList('ff_linkprojetos', _linkprojetos);
  }

  void removeFromLinkprojetos(String value) {
    linkprojetos.remove(value);
    prefs.setStringList('ff_linkprojetos', _linkprojetos);
  }

  void removeAtIndexFromLinkprojetos(int index) {
    linkprojetos.removeAt(index);
    prefs.setStringList('ff_linkprojetos', _linkprojetos);
  }

  void updateLinkprojetosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    linkprojetos[index] = updateFn(_linkprojetos[index]);
    prefs.setStringList('ff_linkprojetos', _linkprojetos);
  }

  void insertAtIndexInLinkprojetos(int index, String value) {
    linkprojetos.insert(index, value);
    prefs.setStringList('ff_linkprojetos', _linkprojetos);
  }

  List<bool> _WINDOSsuporte = [];
  List<bool> get WINDOSsuporte => _WINDOSsuporte;
  set WINDOSsuporte(List<bool> value) {
    _WINDOSsuporte = value;
    prefs.setStringList(
        'ff_WINDOSsuporte', value.map((x) => x.toString()).toList());
  }

  void addToWINDOSsuporte(bool value) {
    WINDOSsuporte.add(value);
    prefs.setStringList(
        'ff_WINDOSsuporte', _WINDOSsuporte.map((x) => x.toString()).toList());
  }

  void removeFromWINDOSsuporte(bool value) {
    WINDOSsuporte.remove(value);
    prefs.setStringList(
        'ff_WINDOSsuporte', _WINDOSsuporte.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromWINDOSsuporte(int index) {
    WINDOSsuporte.removeAt(index);
    prefs.setStringList(
        'ff_WINDOSsuporte', _WINDOSsuporte.map((x) => x.toString()).toList());
  }

  void updateWINDOSsuporteAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    WINDOSsuporte[index] = updateFn(_WINDOSsuporte[index]);
    prefs.setStringList(
        'ff_WINDOSsuporte', _WINDOSsuporte.map((x) => x.toString()).toList());
  }

  void insertAtIndexInWINDOSsuporte(int index, bool value) {
    WINDOSsuporte.insert(index, value);
    prefs.setStringList(
        'ff_WINDOSsuporte', _WINDOSsuporte.map((x) => x.toString()).toList());
  }

  List<bool> _androidSUPORTE = [];
  List<bool> get androidSUPORTE => _androidSUPORTE;
  set androidSUPORTE(List<bool> value) {
    _androidSUPORTE = value;
    prefs.setStringList(
        'ff_androidSUPORTE', value.map((x) => x.toString()).toList());
  }

  void addToAndroidSUPORTE(bool value) {
    androidSUPORTE.add(value);
    prefs.setStringList(
        'ff_androidSUPORTE', _androidSUPORTE.map((x) => x.toString()).toList());
  }

  void removeFromAndroidSUPORTE(bool value) {
    androidSUPORTE.remove(value);
    prefs.setStringList(
        'ff_androidSUPORTE', _androidSUPORTE.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromAndroidSUPORTE(int index) {
    androidSUPORTE.removeAt(index);
    prefs.setStringList(
        'ff_androidSUPORTE', _androidSUPORTE.map((x) => x.toString()).toList());
  }

  void updateAndroidSUPORTEAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    androidSUPORTE[index] = updateFn(_androidSUPORTE[index]);
    prefs.setStringList(
        'ff_androidSUPORTE', _androidSUPORTE.map((x) => x.toString()).toList());
  }

  void insertAtIndexInAndroidSUPORTE(int index, bool value) {
    androidSUPORTE.insert(index, value);
    prefs.setStringList(
        'ff_androidSUPORTE', _androidSUPORTE.map((x) => x.toString()).toList());
  }

  List<bool> _webSUPORTE = [];
  List<bool> get webSUPORTE => _webSUPORTE;
  set webSUPORTE(List<bool> value) {
    _webSUPORTE = value;
    prefs.setStringList(
        'ff_webSUPORTE', value.map((x) => x.toString()).toList());
  }

  void addToWebSUPORTE(bool value) {
    webSUPORTE.add(value);
    prefs.setStringList(
        'ff_webSUPORTE', _webSUPORTE.map((x) => x.toString()).toList());
  }

  void removeFromWebSUPORTE(bool value) {
    webSUPORTE.remove(value);
    prefs.setStringList(
        'ff_webSUPORTE', _webSUPORTE.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromWebSUPORTE(int index) {
    webSUPORTE.removeAt(index);
    prefs.setStringList(
        'ff_webSUPORTE', _webSUPORTE.map((x) => x.toString()).toList());
  }

  void updateWebSUPORTEAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    webSUPORTE[index] = updateFn(_webSUPORTE[index]);
    prefs.setStringList(
        'ff_webSUPORTE', _webSUPORTE.map((x) => x.toString()).toList());
  }

  void insertAtIndexInWebSUPORTE(int index, bool value) {
    webSUPORTE.insert(index, value);
    prefs.setStringList(
        'ff_webSUPORTE', _webSUPORTE.map((x) => x.toString()).toList());
  }

  bool _inicio = false;
  bool get inicio => _inicio;
  set inicio(bool value) {
    _inicio = value;
    prefs.setBool('ff_inicio', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
