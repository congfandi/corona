/*
 * corona
 * AllCountryResponse.dart
 * Created by Cong Fandi on 31/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */



import 'DataCorona.dart';

class AllCountryResponse {
    List<DataCorona> dataCorona;

    AllCountryResponse({this.dataCorona});

    factory AllCountryResponse.fromJson(Map<String, dynamic> json) {
        return AllCountryResponse(
            dataCorona: json['dataCorona'] != null ? (json['dataCorona'] as List).map((i) => DataCorona.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.dataCorona != null) {
            data['dataCorona'] = this.dataCorona.map((v) => v.toJson()).toList();
        }
        return data;
    }
}