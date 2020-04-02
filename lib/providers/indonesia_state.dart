/*
 * corona
 * indonesia_state.dart
 * Created by Cong Fandi on 15/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'package:corona/models/data_province/data_province.dart';
import 'package:corona/models/indonesia_response.dart';
import 'package:corona/rest_api/api_client.dart';
import 'package:corona/rest_api/api_db.dart';
import 'package:flutter/material.dart';

class IndonesiaState with ChangeNotifier {
  bool loadProvince = true;
  bool loadIndonesia = true;
  Indonesia indonesia;
  List<DataCorona> listCorona = new List();
  final ApiClient _apiClient = new ApiClient();

  IndonesiaState() {
    getDetail();
  }

  getDataCountry() {
    _apiClient.getFromKawal(ApiDb.INDONESIA, (status, message, jsonResponse) {
      if (status) {
        IndonesiaResponse response = IndonesiaResponse.fromJson(jsonResponse);
        indonesia = response.indonesia[0];
      }
      loadIndonesia = false;
      notifyListeners();
      return;
    });
  }

  Future<List<DataCorona>> getDetail() async {
    getDataCountry();
    _apiClient.getFromKawal(ApiDb.ALL_INDO_PROVINCE,
        (status, message, jsonResponse) {
      if (status) {
        AllProvinceResponse provinceResponse =
            AllProvinceResponse.fromJson(jsonResponse);
        this.listCorona = provinceResponse.dataCorona;
      }
      loadProvince = false;
      notifyListeners();
      return;
    });
    return listCorona;
  }
}
