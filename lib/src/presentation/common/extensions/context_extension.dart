import 'package:get_it/get_it.dart';

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get localize => AppLocalizations.of(this)!;
  GetIt get locator => GetIt.instance;
}
