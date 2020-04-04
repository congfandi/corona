/*
 * corona
 * chart_state.dart
 * Created by Cong Fandi on 2/4/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'package:corona/models/chart/chart_response.dart';
import 'package:corona/rest_api/api_client.dart';
import 'package:corona/rest_api/api_db.dart';
import 'package:flutter/material.dart';

class ChartState with ChangeNotifier {
  final ApiClient _apiClient = new ApiClient();
  final List<Features> listChart = new List();

  bool showAvg = false;

  setShow() {
    showAvg = !showAvg;
    notifyListeners();
  }

  ChartState() {
    _apiClient.get(
        url: ApiDb.CHART,
        callback: (status, message, map) {
          if (status) {
            listChart.clear();
            ChartResponse chartResponse = ChartResponse.fromJson(map);
            listChart.addAll(chartResponse.features);
          }
          notifyListeners();
          return;
        });
  }
}
