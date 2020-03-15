/*
 * corona
 * home_state.dart
 * Created by Cong Fandi on 15/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'package:corona/helper/db_helper.dart';
import 'package:corona/models/detail_viruses/DetailResponse.dart';
import 'package:corona/models/flag/FlagResponse.dart';
import 'package:corona/models/viruses/VirusResponse.dart';
import 'package:corona/models/viruses/Virus.dart';
import 'package:corona/rest_api/api_client.dart';
import 'package:corona/rest_api/api_db.dart';
import 'package:flutter/material.dart';

class HomeState with ChangeNotifier {
  bool loadingVirus = true;
  Virus pinnedVirus;

  HomeState() {
    getListVirus();
  }

  List<Virus> listVirus = new List();
  DetailResponse provinceResponse;

  getListVirus() async {
    await DbHelper().getCountry().then((objectId) {
      loadingVirus = true;
      notifyListeners();
      new ApiClient(ApiDb.GET_VIRUS_BY_COUNTRY)
          .get((status, message, jsonResponse) {
        if (status) {
          VirusResponse virusResponse = VirusResponse.fromJson(jsonResponse);
          listVirus = virusResponse.viruses;
          listVirus.forEach((virus) {
            if (virus.attributes.oBJECTID == objectId) pinnedVirus = virus;
          });
          loadingVirus = false;
          notifyListeners();
        }
        return;
      });
      return;
    });
  }

  setPinnedVirus(Virus virus) {
    this.pinnedVirus = virus;
    DbHelper().saveCountry(virus.attributes.oBJECTID);
    notifyListeners();
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
