/*
 * corona
 * indonesia_response.dart
 * Created by Cong Fandi on 2/4/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

class IndonesiaResponse {
  List<Indonesia> indonesia;

  IndonesiaResponse({this.indonesia});

  IndonesiaResponse.fromJson(Map<String, dynamic> json) {
    if (json['dataCorona'] != null) {
      indonesia = new List<Indonesia>();
      json['dataCorona'].forEach((v) {
        indonesia.add(new Indonesia.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.indonesia != null) {
      data['dataCorona'] = this.indonesia.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Indonesia {
  String name;
  String positif;
  String sembuh;
  String meninggal;

  Indonesia({this.name, this.positif, this.sembuh, this.meninggal});

  Indonesia.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    positif = json['positif'];
    sembuh = json['sembuh'];
    meninggal = json['meninggal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['positif'] = this.positif;
    data['sembuh'] = this.sembuh;
    data['meninggal'] = this.meninggal;
    return data;
  }
}
