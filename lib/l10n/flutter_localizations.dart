import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;
import 'localizations_en.dart' deferred as localizations_en;
import 'localizations_my.dart' deferred as localizations_my;


abstract class MyLocalizations {
  MyLocalizations(String locale)
      : assert(locale != null),
        localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static MyLocalizations of(BuildContext context) {
    return Localizations.of<MyLocalizations>(
        context, MyLocalizations);
  }

  static const LocalizationsDelegate<MyLocalizations> delegate =
  _LocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('my'),
  ];

  // app bar title
  String get appBarTitle;

  String get shortDesc;

  String get longDesc;
}

class _LocalizationsDelegate
    extends LocalizationsDelegate<MyLocalizations> {
  const _LocalizationsDelegate();

  @override
  Future<MyLocalizations> load(Locale locale) {
    return _lookupLocalizations(locale);
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'en',
        'my',
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_LocalizationsDelegate old) => false;
}

/// Lazy load the library for web, on other platforms we return the
/// localizations synchronously.
Future<MyLocalizations> _loadLibraryForWeb(
  Future<dynamic> Function() loadLibrary,
    MyLocalizations Function() localizationClosure,
) {
  if (kIsWeb) {
    return loadLibrary().then((dynamic _) => localizationClosure());
  } else {
    return SynchronousFuture<MyLocalizations>(localizationClosure());
  }
}

Future<MyLocalizations> _lookupLocalizations(Locale locale) {

  switch (locale.languageCode) {
    case 'en':
      return _loadLibraryForWeb(localizations_en.loadLibrary,
          () => localizations_en.LocalizationsEn());

    case 'my':
      return _loadLibraryForWeb(localizations_my.loadLibrary,
          () =>localizations_my.LocalizationsMy());

  }

  assert(false,
      'Localizations.delegate failed to load unsupported locale "$locale"');
  return null;
}
