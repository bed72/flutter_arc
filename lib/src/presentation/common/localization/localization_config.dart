import 'dart:ui';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

const supportedLocales = [Locale('pt', '')];

const localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
