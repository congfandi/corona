/*
 * corona
 * VirusResponse.dart
 * Created by Cong Fandi on 15/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'Virus.dart';

class VirusResponse {
  List<Virus> viruses;

  VirusResponse({this.viruses});

  factory VirusResponse.fromJson(Map<String, dynamic> json) {
    return VirusResponse(
      viruses: json['features'] != null
          ? (json['features'] as List).map((i) => Virus.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
