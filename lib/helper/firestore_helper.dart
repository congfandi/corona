/*
 * corona
 * firestore_helper.dart
 * Created by Cong Fandi on 6/4/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreHelper {
  final Firestore _firestore = Firestore.instance;

  create(Map<String, dynamic> data) {
    _firestore.collection('users').document().setData(data).then((status) {
      print("sukses");
    }).catchError((onError) {
      print("error $onError");
    });
  }

  update() {}

  read() {}

  delete() {}
}
