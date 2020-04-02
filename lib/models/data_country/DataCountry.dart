/*
 * corona
 * DataCountry.dart
 * Created by Cong Fandi on 31/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

class DataCountry {
  int active;
  int confirmed;
  String countryRegion;
  int deaths;
  int lastUpdate;
  double lat;
  double longi;
  int objectId;
  int recovered;

  DataCountry(
      {this.active,
      this.confirmed,
      this.countryRegion,
      this.deaths,
      this.lastUpdate,
      this.lat,
      this.longi,
      this.objectId,
      this.recovered});

  factory DataCountry.fromJson(Map<String, dynamic> json) {
    return DataCountry(
      active: json['Active'],
      confirmed: json['Confirmed'],
      countryRegion: json['Country_Region'],
      deaths: json['Deaths'],
      lastUpdate: json['Last_Update'],
      lat: double.parse(json['Lat'].toString()),
      longi: double.parse(json['Long_'].toString()),
      objectId: json['OBJECTID'],
      recovered: json['Recovered'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['confirmed'] = this.confirmed;
    data['country_Region'] = this.countryRegion;
    data['deaths'] = this.deaths;
    data['last_Update'] = this.lastUpdate;
    data['lat'] = this.lat;
    data['long_'] = this.longi;
    data['oBJECTID'] = this.objectId;
    data['recovered'] = this.recovered;
    return data;
  }
}
