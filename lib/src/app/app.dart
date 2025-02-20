import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:housepetall/src/app/injection_providers.dart';
import 'package:housepetall/src/app/routes.dart';
import 'package:housepetall/src/app/routing.dart';
import 'package:housepetall/src/common/common.dart';
import 'package:housepetall/src/localization/languages.dart';
import 'package:housepetall/src/presentation/themes/src/theme_data.dart';
import 'package:toastification/toastification.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: InjectionProviders(
        child: MaterialApp(
          restorationScopeId: 'app',
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            HousePetAllLocalization.delegate,
          ],
          supportedLocales: [
            HousePetAllLocale.en,
            HousePetAllLocale.id,
          ],
          onGenerateTitle: (BuildContext context) =>
              HousePetAllLocalization.of(context)!.appTitle,
          theme: HousePetAllThemes.basic,
          darkTheme: HousePetAllThemes.darkBasic,
          onGenerateRoute: generateRoute,
          initialRoute: Routes.root,
        ),
      ),
    );
  }
}
