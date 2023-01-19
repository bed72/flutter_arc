import 'package:get_it/get_it.dart';

import 'package:flutter/material.dart';

import 'package:seller/src/app.dart';

import 'package:seller/src/external/adapters/locator/locator_adapter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocatorAdapterImpl(locator: GetIt.instance).initialized();

  runApp(const App());
}
