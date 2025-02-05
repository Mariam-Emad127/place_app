import 'package:advanced_flutter/app/app_prefs.dart';
import 'package:advanced_flutter/app/di.dart';
import 'package:advanced_flutter/presentation/resources/routes_manager.dart';
import 'package:advanced_flutter/presentation/resources/theme_manger.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();
  //const MyApp({super.key});
static MyApp _instance=MyApp._internal();
  @override
  State<MyApp> createState() => _MyAppState();

  factory MyApp()=>_instance;
}

class _MyAppState extends State<MyApp> {
  AppPreferences appPreferences=instance<AppPreferences>();

@override
  void didChangeDependencies() {
    appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      //localizationsDelegates: context.localizationDelegates,
      //supportedLocales: context.supportedLocales,
      //locale: context.locale,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    
    );
  }
}