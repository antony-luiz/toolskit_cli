import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'wltto2fb': {
      'pt': 'Toolskit CLI',
      'en': 'Toolskit CLI',
    },
    '49kxzrbw': {
      'pt': 'By antony_luiz_',
      'en': 'By antony_luiz_',
    },
    'unrewsil': {
      'pt': 'Adicionar  ',
      'en': 'Add',
    },
    '0lhakzge': {
      'pt': 'flutter doctor',
      'en': 'flutter doctor',
    },
    '6d677ws8': {
      'pt': 'flutter upgrade',
      'en': 'flutter upgrade',
    },
    'u2dlsoa5': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // visualizar
  {
    '4s1hgino': {
      'pt': 'Atualizar arquivos  ',
      'en': 'Update files',
    },
    '6wwrvu8q': {
      'pt': 'Voltar',
      'en': 'Back',
    },
    'c60b9smr': {
      'pt': 'build (windows)',
      'en': 'build ( windows)',
    },
    'hiz4yyjm': {
      'pt': 'build para teste ',
      'en': 'build for testing',
    },
    'tsqxpbrl': {
      'pt': 'Compilar',
      'en': 'Compile',
    },
    'mu3bv7pd': {
      'pt': 'build principal',
      'en': 'main building',
    },
    'k0mc5479': {
      'pt': 'Compilar',
      'en': 'Compile',
    },
    '52zn92y1': {
      'pt': 'build (Android)',
      'en': 'build (Android)',
    },
    'zjrxx5nv': {
      'pt': 'build para teste ',
      'en': 'build for testing',
    },
    '3jlr3cqq': {
      'pt': 'Compilar',
      'en': 'Compile',
    },
    'skbrn2at': {
      'pt': 'build principal',
      'en': 'main building',
    },
    'jq4w77rv': {
      'pt': 'Compilar',
      'en': 'Compile',
    },
    'caqu5gr9': {
      'pt': 'Flutter',
      'en': 'Flutter',
    },
    'r4s29ly5': {
      'pt': 'Limpar cache',
      'en': 'Clear cache',
    },
    'fabzznqe': {
      'pt': 'Executar',
      'en': 'Run',
    },
    '4i33hr6x': {
      'pt': 'Atualizar dependências',
      'en': 'Update dependencies',
    },
    'k87xlvp3': {
      'pt': 'Executar',
      'en': 'Run',
    },
    'sobicht8': {
      'pt': 'At. dep.  (major)',
      'en': 'At. dep.  (major)',
    },
    'g8pmthwe': {
      'pt': 'Executar',
      'en': 'Run',
    },
    'cks33t6s': {
      'pt': 'build (Web)',
      'en': 'build (Web)',
    },
    '0oaua6ue': {
      'pt': 'build para teste ',
      'en': 'build for testing',
    },
    '46mste19': {
      'pt': 'Compilar',
      'en': 'Compile',
    },
    '4llmmz1p': {
      'pt': 'build principal',
      'en': 'main building',
    },
    '5u4n3f60': {
      'pt': 'Compilar',
      'en': 'Compile',
    },
    '3j137qoq': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // Inicio
  {
    'gvp4h92s': {
      'pt': 'Toolskit CLI',
      'en': 'Toolskit CLI',
    },
    'n6xx6emf': {
      'pt': 'By antony_luiz_',
      'en': 'By antony_luiz_',
    },
    'ri52s1xv': {
      'pt': 'canal de atualização',
      'en': 'update channel',
    },
    'x33s6y71': {
      'pt': 'Começar',
      'en': 'Start',
    },
    'eu5795r1': {
      'pt': 'Instalar flutterflow cli',
      'en': 'Install FlutterFlow CLI',
    },
    'gz3onvse': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // Idioma
  {
    'v32hp7b3': {
      'pt': 'idioma',
      'en': 'idioma',
    },
    'zvg3opqn': {
      'pt': 'language',
      'en': 'language',
    },
    'tdptrssf': {
      'pt': 'português br',
      'en': 'português br',
    },
    '3dt3ipf0': {
      'pt': 'Inglês',
      'en': 'Inglês',
    },
    'oroaom49': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // adicionar
  {
    '29un0y3b': {
      'pt': 'Adicionar projeto',
      'en': 'Add project',
    },
    '7tvsffbt': {
      'pt': '',
      'en': '',
    },
    '18sv3ses': {
      'pt': 'link cli',
      'en': 'link cli',
    },
    'ar1fbcqm': {
      'pt': 'Adicionar',
      'en': 'Add',
    },
  },
  // erro
  {
    'qtyeendy': {
      'pt': 'ERRO (log gerado)',
      'en': 'ERROR (log generated)',
    },
  },
  // Miscellaneous
  {
    '4s588gyj': {
      'pt': '',
      'en': '',
    },
    'j4t82hhx': {
      'pt': '',
      'en': '',
    },
    'ro7ykk48': {
      'pt': '',
      'en': '',
    },
    'gocrkpdv': {
      'pt': '',
      'en': '',
    },
    's4ht3xlm': {
      'pt': '',
      'en': '',
    },
    'ggt0seat': {
      'pt': '',
      'en': '',
    },
    'jz166h5b': {
      'pt': '',
      'en': '',
    },
    'mw6wbjx5': {
      'pt': '',
      'en': '',
    },
    'ni1gmvk9': {
      'pt': '',
      'en': '',
    },
    '60tbrgye': {
      'pt': '',
      'en': '',
    },
    'f5hhkph6': {
      'pt': '',
      'en': '',
    },
    'ore3qal9': {
      'pt': '',
      'en': '',
    },
    '9o52h6n3': {
      'pt': '',
      'en': '',
    },
    'zr9d7sou': {
      'pt': '',
      'en': '',
    },
    'aa6y397t': {
      'pt': '',
      'en': '',
    },
    'slmfux2w': {
      'pt': '',
      'en': '',
    },
    '5fkxx88s': {
      'pt': '',
      'en': '',
    },
    'wluf8abn': {
      'pt': '',
      'en': '',
    },
    'q2k3ahal': {
      'pt': '',
      'en': '',
    },
    'v21bvk4i': {
      'pt': '',
      'en': '',
    },
    'fd5vvpuz': {
      'pt': '',
      'en': '',
    },
    'v21c6ss3': {
      'pt': '',
      'en': '',
    },
    '20i62uub': {
      'pt': '',
      'en': '',
    },
    'vnc4cirm': {
      'pt': '',
      'en': '',
    },
    'mnp6zlrd': {
      'pt': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
