/*
 * corona
 * app_navigator.dart
 * Created by Cong Fandi on 2/4/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */
import 'package:corona/views/all_counrty_view.dart';
import 'package:corona/views/article_view.dart';
import 'package:corona/views/faq_view.dart';
import 'package:corona/views/penanganan_view.dart';
import 'package:corona/views/resmi_view.dart';
import 'package:corona/views/rujukan_view.dart';

class AppNavigator {
   final routes = {
    "/pantau": (_) => AllCountryView(),
    "/artikel": (_) => ArticleView(),
    "/penanganan": (_) => PenangananView(),
    "/rujukan": (_) => RujukanView(),
    "/resmi": (_) => SitusResmiView(),
    "/faq": (_) => FaqView(),
  };
}
