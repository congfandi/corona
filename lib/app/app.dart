/*
 * corona
 * app.dart
 * Created by Cong Fandi on 15/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'package:corona/app/app_theme.dart';
import 'package:corona/providers/all_country_state.dart';
import 'package:corona/providers/chart_state.dart';
import 'package:corona/providers/home_state.dart';
import 'package:corona/providers/indonesia_state.dart';
import 'package:corona/providers/main_state.dart';
import 'package:corona/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:corona/views/all_counrty_view.dart';
import 'package:corona/views/article_view.dart';
import 'package:corona/views/faq_view.dart';
import 'package:corona/views/penanganan_view.dart';
import 'package:corona/views/resmi_view.dart';
import 'package:corona/views/rujukan_view.dart';

class App extends StatelessWidget {
  final routes = {
    "/pantau": (_) => AllCountryView(),
    "/artikel": (_) => ArticleView(),
    "/penanganan": (_) => PenangananView(),
    "/rujukan": (_) => RujukanView(),
    "/situs_resmi": (_) => SitusResmiView(),
    "/faq": (_) => FaqView(),
  };

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeState()),
        ChangeNotifierProvider(create: (_) => AllCountryState()),
        ChangeNotifierProvider(create: (_) => ChartState()),
        ChangeNotifierProvider(create: (_) => IndonesiaState()),
        ChangeNotifierProvider(create: (_) => MainState()),
      ],
      child: MaterialApp(
        routes: routes,
        title: 'Pantau Corona',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: AppTheme.colors['merah'],
        ),
        home: MainView(),
      ),
    );
  }
}
