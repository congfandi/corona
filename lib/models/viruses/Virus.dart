/*
 * corona
 * Virus.dart
 * Created by Cong Fandi on 15/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'Attributes.dart';

class Virus {
  Attributes attributes;

  Virus({this.attributes});

  factory Virus.fromJson(Map<String, dynamic> json) {
    return Virus(
      attributes: json['attributes'] != null
          ? Attributes.fromJson(json['attributes'])
          : null,
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
