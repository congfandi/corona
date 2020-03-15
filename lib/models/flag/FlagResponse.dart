/*
 * corona
 * FlagResponse.dart
 * Created by Cong Fandi on 15/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

class FlagResponse {
  String alpha2Code;
  String alpha3Code;
  int area;
  String capital;
  String cioc;
  String demonym;
  String flag;
  int gini;
  String name;
  int population;
  String region;
  String subregion;

  FlagResponse(
      {this.alpha2Code, this.alpha3Code, this.area, this.capital, this.cioc, this.demonym, this.flag, this.gini, this.name, this.population, this.region, this.subregion});

  factory FlagResponse.fromJson(Map<String, dynamic> json) {
    return FlagResponse(
      alpha2Code: json['alpha2Code'],
      alpha3Code: json['alpha3Code'],
      area: json['area'],
      capital: json['capital'],
      cioc: json['cioc'],
      demonym: json['demonym'],
      flag: json['flag'],
      gini: json['gini'],
      name: json['name'],
      population: json['population'],
      region: json['region'],
      subregion: json['subregion'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alpha2Code'] = this.alpha2Code;
    data['alpha3Code'] = this.alpha3Code;
    data['area'] = this.area;
    data['capital'] = this.capital;
    data['cioc'] = this.cioc;
    data['demonym'] = this.demonym;
    data['flag'] = this.flag;
    data['gini'] = this.gini;
    data['name'] = this.name;
    data['population'] = this.population;
    data['region'] = this.region;
    data['subregion'] = this.subregion;
    return data;
  }
}