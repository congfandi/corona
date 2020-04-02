/*
 * corona
 * app_appbar.dart
 * Created by Cong Fandi on 2/4/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'package:flutter/material.dart';

class AppAppbar {
  appbar({String title, bool centerTitle, Color backgroundColors}) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: backgroundColors,
    );
  }
}
