/*
 * corona
 * Attributes.dart
 * Created by Cong Fandi on 15/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

class Attributes {
  int active;
  int confirmed;
  String country_Region;
  int deaths;
  int last_Update;
  int oBJECTID;
  String province_State;
  int recovered;

  Attributes(
      {this.active,
      this.confirmed,
      this.country_Region,
      this.deaths,
      this.last_Update,
      this.oBJECTID,
      this.province_State,
      this.recovered});

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      active: json['Active'],
      confirmed: json['Confirmed'],
      country_Region: json['Country_Region'],
      province_State: json['Province_State'],
      deaths: json['Deaths'],
      last_Update: json['Last_Update'],
      oBJECTID: json['OBJECTID'],
      recovered: json['Recovered'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['confirmed'] = this.confirmed;
    data['country_Region'] = this.country_Region;
    data['deaths'] = this.deaths;
    data['last_Update'] = this.last_Update;
    data['oBJECTID'] = this.oBJECTID;
    data['province_State'] = this.province_State;
    data['recovered'] = this.recovered;
    return data;
  }
}
