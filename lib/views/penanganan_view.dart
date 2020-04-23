/*
 * corona
 * penanganan_view.dart
 * Created by Cong Fandi on 2/4/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corona/app/app_appbar.dart';
import 'package:flutter/material.dart';

class PenangananView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppAppbar().appbar(title: 'Penanganan'),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              return new ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  return Container(
                    margin:
                        EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          child: Image.network(
                            document['pic'],
                            width: 70,
                            height: 70,
                          ),
                        ),
                        Expanded(
                          child: new ListTile(
                            title: new Text(document['name'] ?? ""),
                            subtitle: new Text(
                                document['gender'] ? "Laki-laki" : "Perempuan"),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
          }
        },
      ),
    );
  }
}
