/*
 * corona
 * data_province.dart
 * Created by Cong Fandi on 2/4/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

class AllProvinceResponse {
  List<DataCorona> dataCorona;

  AllProvinceResponse({this.dataCorona});

  AllProvinceResponse.fromJson(Map<String, dynamic> json) {
    if (json['dataCorona'] != null) {
      dataCorona = new List<DataCorona>();
      json['dataCorona'].forEach((v) {
        dataCorona.add(new DataCorona.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataCorona != null) {
      data['dataCorona'] = this.dataCorona.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataCorona {
  DataProvince dataProvince;

  DataCorona({this.dataProvince});

  DataCorona.fromJson(Map<String, dynamic> json) {
    dataProvince = json['attributes'] != null
        ? new DataProvince.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataProvince != null) {
      data['attributes'] = this.dataProvince.toJson();
    }
    return data;
  }
}

class DataProvince {
  int fID;
  int kodeProvi;
  String provinsi;
  int kasusPosi;
  int kasusSemb;
  int kasusMeni;

  DataProvince(
      {this.fID,
      this.kodeProvi,
      this.provinsi,
      this.kasusPosi,
      this.kasusSemb,
      this.kasusMeni});

  DataProvince.fromJson(Map<String, dynamic> json) {
    fID = json['FID'];
    kodeProvi = json['Kode_Provi'];
    provinsi = json['Provinsi'];
    kasusPosi = json['Kasus_Posi'];
    kasusSemb = json['Kasus_Semb'];
    kasusMeni = json['Kasus_Meni'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FID'] = this.fID;
    data['Kode_Provi'] = this.kodeProvi;
    data['Provinsi'] = this.provinsi;
    data['Kasus_Posi'] = this.kasusPosi;
    data['Kasus_Semb'] = this.kasusSemb;
    data['Kasus_Meni'] = this.kasusMeni;
    return data;
  }
}
