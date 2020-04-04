/*
 * corona
 * api_client.dart
 * Created by Cong Fandi on 15/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  getFromKawal(
      String url,
      ValueChanged callback(bool status, String message,
          Map<String, dynamic> jsonResponse)) async {
    await http.get(url).then((response) {
      print('hasil request {"dataCorona":${response.body}}');
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode('{"dataCorona":${response.body}}');
        callback(true, 'Request Success', jsonResponse);
      } else {
        callback(false, response.body, null);
      }
    });
  }

  get(
      {@required String url,
      ValueChanged callback(
          bool status, String message, Map<String, dynamic> map)}) async {
    await http.get(url).then((response) {
      if (response.statusCode == 2) {
        callback(true, 'request done!', jsonDecode(response.body));
      } else {
        callback(false, 'Error with Status Code ${response.statusCode}', null);
      }
    }).catchError((err) {
      callback(false, err.toString(), null);
    });
  }
}
