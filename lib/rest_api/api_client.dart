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
  final String _url;

  ApiClient(this._url);

  get(
      ValueChanged callback(bool status, String message,
          Map<String, dynamic> jsonResponse)) async {
    await http.get(_url).then((response) {
      print('hasil request ${response.body}');
      var jsonResponse = jsonDecode(response.body);
      callback(true, 'Request Success', jsonResponse);
    });
  }
}
