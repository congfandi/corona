/*
 * corona
 * DetailResponse.dart
 * Created by Cong Fandi on 15/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'Province.dart';
import 'SpatialReference.dart';
import 'UniqueIdField.dart';

class DetailResponse {
  List<Province> provinces;
  String geometryType;
  String globalIdFieldName;
  String objectIdFieldName;
  String countryFlag;
  SpatialReference spatialReference;

  DetailResponse(
      {this.provinces,
      this.geometryType,
      this.globalIdFieldName,
      this.objectIdFieldName,
      this.spatialReference});

  factory DetailResponse.fromJson(Map<String, dynamic> json) {
    return DetailResponse(
      provinces: json['features'] != null
          ? (json['features'] as List).map((i) => Province.fromJson(i)).toList()
          : null,
      geometryType: json['geometryType'],
      globalIdFieldName: json['globalIdFieldName'],
      objectIdFieldName: json['objectIdFieldName'],
      spatialReference: json['spatialReference'] != null
          ? SpatialReference.fromJson(json['spatialReference'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['geometryType'] = this.geometryType;
    data['globalIdFieldName'] = this.globalIdFieldName;
    data['objectIdFieldName'] = this.objectIdFieldName;
    if (this.provinces != null) {
      data['features'] = this.provinces.map((v) => v.toJson()).toList();
    }
    if (this.spatialReference != null) {
      data['spatialReference'] = this.spatialReference.toJson();
    }
    return data;
  }
}
