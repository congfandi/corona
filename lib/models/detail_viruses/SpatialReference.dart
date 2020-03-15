/*
 * corona
 * SpatialReference.dart
 * Created by Cong Fandi on 15/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

class SpatialReference {
    int latestWkid;
    int wkid;

    SpatialReference({this.latestWkid, this.wkid});

    factory SpatialReference.fromJson(Map<String, dynamic> json) {
        return SpatialReference(
            latestWkid: json['latestWkid'], 
            wkid: json['wkid'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['latestWkid'] = this.latestWkid;
        data['wkid'] = this.wkid;
        return data;
    }
}