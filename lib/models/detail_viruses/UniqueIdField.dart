/*
 * corona
 * UniqueIdField.dart
 * Created by Cong Fandi on 15/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

class UniqueIdField {
    bool isSystemMaintained;
    String name;

    UniqueIdField({this.isSystemMaintained, this.name});

    factory UniqueIdField.fromJson(Map<String, dynamic> json) {
        return UniqueIdField(
            isSystemMaintained: json['isSystemMaintained'], 
            name: json['name'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['isSystemMaintained'] = this.isSystemMaintained;
        data['name'] = this.name;
        return data;
    }
}