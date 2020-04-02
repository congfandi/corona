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
  DataCountry pinnedCountry;
  final ApiClient _apiClient = new ApiClient();

  AllCountryState() {
    getAllCountry();
  }

  List<DataCorona> listCoronaByCountry = new List();

  Future<List<DataCorona>> getAllCountry() async {
    _apiClient.getFromKawal(ApiDb.ALL_COUNTRY, (status, message, jsonResponse) {
      if (status) {
        AllCountryResponse _response =
            AllCountryResponse.fromJson(jsonResponse);
        this.listCoronaByCountry = _response.dataCorona;
        loadingVirus = false;
        listCoronaByCountry.forEach((data) {
          DbHelper().getCountry().then((code) {
            if (code == data.attributes.objectId)
              setPinnedVirus(data.attributes);
          });
        });
      }
      notifyListeners();
      return;
    });
    return listCoronaByCountry;
  }

  setPinnedVirus(DataCountry dataCountry) {
    this.pinnedCountry = dataCountry;
    DbHelper().saveCountry(dataCountry.objectId);
    notifyListeners();
  }
}
