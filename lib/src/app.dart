import 'package:flutter/material.dart';

import 'package:seller/src/presentation/screens/auth/signup/sign_up_screen.dart';

import 'package:seller/src/presentation/common/extensions/context_extension.dart';
import 'package:seller/src/presentation/common/localization/localization_config.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      supportedLocales: supportedLocales,
      localizationsDelegates: localizationsDelegates,
      onGenerateTitle: (BuildContext context) => context.localize.appTitle,
      home: const SignUpScreen(),
    );
  }
}
