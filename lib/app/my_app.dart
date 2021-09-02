import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gs_two/app/screens/home/home_manager/filter_home_page_manager.dart';
import 'package:gs_two/app/screens/home/home_manager/home_page_manager.dart';
import 'package:gs_two/app/screens/home/home_page.dart';
import 'package:provider/provider.dart';

import 'shared/styles/custom_theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomePageManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => FilterHomePageManager(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'gs_avaliation',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('pt', 'BR'),
        ],
        theme: CustomTheme.theme,
        home: HomePage(),
      ),
    );
  }
}