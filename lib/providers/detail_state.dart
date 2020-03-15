/*
 * corona
 * detail_state.dart
 * Created by Cong Fandi on 15/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'package:corona/models/detail_viruses/DetailResponse.dart';
import 'package:corona/models/detail_viruses/Province.dart';
import 'package:corona/models/viruses/Virus.dart';
import 'package:corona/providers/home_state.dart';
import 'package:corona/rest_api/api_client.dart';
import 'package:corona/rest_api/api_db.dart';
import 'package:flutter/material.dart';

class DetailState with ChangeNotifier {
  final HomeState _homeState;
  final Virus _virus;
  bool loadingDetail = true;
  List<Province> listProvince = new List();

  DetailState(this._homeState, this._virus) {
    getDetail();
  }

  updateWidget(){
    notifyListeners();
  }
  getDetail() async {
    await new ApiClient(ApiDb.detail(_virus.attributes.country_Region))
        .get((status, message, jsonResponse) {
      if (status) {
        DetailResponse detailResponse = DetailResponse.fromJson(jsonResponse);
        listProvince = detailResponse.provinces;
      }
      loadingDetail = false;
      notifyListeners();
      return;
    });
  }
}
