/*
 * corona
 * db_helper.dart
 * Created by Cong Fandi on 15/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'package:shared_preferences/shared_preferences.dart';

class DbHelper {
  saveCountry(int objectId) async {
    var ref = await SharedPreferences.getInstance();
    ref.setInt('country', objectId);
  }

  Future<int> getCountry() async {
    var ref = await SharedPreferences.getInstance();
    var data = ref.getInt('country') ?? 53;
    return data;
  }
}
