/*
 * corona
 * DataCorona.dart
 * Created by Cong Fandi on 31/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */


import 'DataCountry.dart';

class DataCorona {
    DataCountry attributes;

    DataCorona({this.attributes});

    factory DataCorona.fromJson(Map<String, dynamic> json) {
        return DataCorona(
            attributes: json['attributes'] != null ? DataCountry.fromJson(json['attributes']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.attributes != null) {
            data['attributes'] = this.attributes.toJson();
        }
        return data;
    }
}