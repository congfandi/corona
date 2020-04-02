/*
 * corona
 * main_state.dart
 * Created by Cong Fandi on 2/4/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'package:corona/views/chart_view.dart';
import 'package:corona/views/home_view.dart';
import 'package:corona/views/indonesia_view.dart';
import 'package:flutter/material.dart';

class MainState with ChangeNotifier {
  int currentPage = 0;
  List<Widget> pages = [HomeView(), IndonesiaView(), ChartView()];

  setPage(int page) {
    currentPage = page;
    notifyListeners();
  }
}
