/*
 * corona
 * convert_price.dart
 * Created by Cong Fandi on 15/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

class ConvertPrice {
  final int _price;
  String stringPrice;

  ConvertPrice(this._price) {
    stringPrice = _price.toString();
  }

  String getIdr() {
    List<String> charPrice = new List();
    charPrice.addAll(stringPrice.split(""));
    int charLength = charPrice.length;
    int count = 0;
    for (int i = charLength - 1; i >= 0; i--) {
      count++;
      if (count % 3 == 0 && i != 0) {
        charPrice.insert(i, ".");
      }
    }
    String finalPrice = "";
    charPrice.forEach((d) {
      finalPrice += d;
    });
    return "$finalPrice";
  }
}
