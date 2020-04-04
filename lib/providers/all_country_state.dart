/*
 * corona
 * all_country_state.dart
 * Created by Cong Fandi on 15/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'package:corona/helper/db_helper.dart';
import 'package:corona/models/data_country/AllCountryResponse.dart';
import 'package:corona/models/data_country/DataCorona.dart';
import 'package:corona/models/data_country/DataCountry.dart';
import 'package:corona/rest_api/api_client.dart';
import 'package:corona/rest_api/api_db.dart';
import 'package:flutter/material.dart';

class AllCountryState with ChangeNotifier {
  bool loadingVirus = true;
  final ApiClient _apiClient = new ApiClient();
  int totalConfirm = 0;
  int totalDeath = 0;
  int totalRecovered = 0;

  AllCountryState() {
    getAllCountry();
  }

  List<DataCorona> listCoronaByCountry = new List();

  Future<List<DataCorona>> getAllCountry() async {
    totalConfirm = 0;
    totalDeath = 0;
    totalRecovered = 0;
    _apiClient.getFromKawal(ApiDb.ALL_COUNTRY, (status, message, jsonResponse) {
      if (status) {
        AllCountryResponse _response =
            AllCountryResponse.fromJson(jsonResponse);
        this.listCoronaByCountry = _response.dataCorona;
        loadingVirus = false;
        listCoronaByCountry.forEach((data) {
          totalConfirm += data.attributes.confirmed;
          totalDeath += data.attributes.deaths;
          totalRecovered += data.attributes.recovered;
        });
      }
      notifyListeners();
      return;
    });
    return listCoronaByCountry;
  }
}
