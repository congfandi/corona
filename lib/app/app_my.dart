/*
 * corona
 * app_my.dart
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
import 'package:corona/views/chart_view.dart';
import 'package:corona/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:provider/provider.dart';
import 'package:corona/views/all_counrty_view.dart';
import 'package:corona/views/article_view.dart';
import 'package:corona/views/faq_view.dart';
import 'package:corona/views/penanganan_view.dart';
import 'package:corona/views/resmi_view.dart';
import 'package:corona/views/rujukan_view.dart';

class MyApp extends StatelessWidget {
  final routes = {
    "/chart": (_) => ChartView(),
    "/artikel": (_) => ArticleView(),
    "/penanganan": (_) => PenangananView(),
    "/rujukan": (_) => RujukanView(),
    "/situs_resmi": (_) => SitusResmiView(),
    "/faq": (_) => new WebviewScaffold(
          url: "https://www.covid19.go.id/tanya-jawab/",
          appBar: new AppBar(
            title: new Text("FAQ"),
          ),
        ),
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
          primarySwatch: Colors.blue,
        ),
        home: MainView(),
      ),
    );
  }
}
