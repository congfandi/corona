/*
 * corona
 * article_view.dart
 * Created by Cong Fandi on 2/4/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'package:corona/app/app_appbar.dart';
import 'package:corona/helper/firestore_helper.dart';
import 'package:flutter/material.dart';

class ArticleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FireStoreHelper().create({
      "name": "New Name",
      "email": "newemeail@mail.com",
      "gender": false,
      "birthDate": DateTime.now()
    });
    return Scaffold(
      appBar: new AppAppbar().appbar(title: 'Artikel'),
    );
  }
}
