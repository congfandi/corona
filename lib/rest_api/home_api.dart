/*
 * corona
 * home_api.dart
 * Created by Cong Fandi on 15/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'package:corona/models/detail_viruses/DetailResponse.dart';
import 'package:corona/models/flag/FlagResponse.dart';
import 'package:corona/models/viruses/VirusResponse.dart';
import 'package:corona/models/viruses/Virus.dart';
import 'package:corona/rest_api/api_client.dart';
import 'package:corona/rest_api/api_db.dart';
import 'package:flutter/cupertino.dart';

class HomeApi {
  List<Virus> listVirus = new List();
  DetailResponse provinceResponse;

  getListVirus(ValueChanged callback()) {
    new ApiClient(ApiDb.GET_VIRUS_BY_COUNTRY)
        .get((status, message, jsonResponse) {
      if (status) {
        VirusResponse virusResponse =
            VirusResponse.fromJson(jsonResponse);
        listVirus.addAll(virusResponse.viruses);
        callback();
      }
      return;
    });
  }

  getDetail(String country) {
    new ApiClient(ApiDb.detail(country)).get((status, message, jsonResponse) {
      if (status) {
        getFlag(country, (flag) {
          provinceResponse = DetailResponse.fromJson(jsonResponse);
          provinceResponse.countryFlag = flag;
          return;
        });
      }
      return;
    });
  }

  getFlag(String country, ValueChanged callback(String flagUrl)) {
    new ApiClient(ApiDb.getFlag(country)).get((status, message, jsonResponse) {
      if (status) {
        FlagResponse flagResponse = FlagResponse.fromJson(jsonResponse);
        callback(flagResponse.flag);
      }
      return;
    });
  }
}
