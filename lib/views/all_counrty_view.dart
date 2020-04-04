/*
 * corona
 * all_counrty_view.dart
 * Created by Cong Fandi on 15/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'package:corona/app/app_theme.dart';
import 'package:corona/helper/contry_to_code.dart';
import 'package:corona/helper/convert_price.dart';
import 'package:corona/models/data_country/DataCountry.dart';
import 'package:corona/providers/all_country_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AllCountryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AllCountryState allCountryState =
        Provider.of<AllCountryState>(context);
    return Scaffold(
      body: _backGround(context, allCountryState),
    );
  }

  _backGround(BuildContext context, AllCountryState hs) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.fill,
            ),
          ),
          _body(context, hs),
        ],
      ),
    );
  }

  _body(BuildContext context, AllCountryState hs) {
    return RefreshIndicator(
      onRefresh: () => hs.getAllCountry(),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                _header(context, hs),
                hs.loadingVirus
                    ? Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: AppTheme.colors['putih'],
                            border: Border.all(
                              color: AppTheme.colors['putih'],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        height: MediaQuery.of(context).size.height - 300,
                        child: ListView.builder(
                          itemBuilder: (c, i) => i == 0
                              ? _title()
                              : _item(hs.listCoronaByCountry[i - 1].attributes,
                                  hs, c),
                          itemCount: hs.listCoronaByCountry.length + 1,
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }

  _header(BuildContext context, AllCountryState hs) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(32.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 32)),
            Text(
              "D U N I A",
              style: TextStyle(
                  color: AppTheme.colors['putih'],
                  fontWeight: FontWeight.bold,
                  fontSize: 27),
            ),
            OutlineButton(
              onPressed: null,
              borderSide: BorderSide(width: 4),
              child: Text(
                hs.loadingVirus
                    ? "wait.."
                    : "${ConvertPrice(hs.totalConfirm).getIdr()} Kasus",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: AppTheme.colors['putih'],
                    fontWeight: FontWeight.bold),
              ),
              color: AppTheme.colors['putih'],
              disabledBorderColor: AppTheme.colors['putih'],
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(
                  color: AppTheme.colors['putih'],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.group,
                        color: AppTheme.colors['putih'],
                      ),
                      Padding(padding: EdgeInsets.only(left: 8)),
                      Text(
                        hs.loadingVirus
                            ? "loading.."
                            : "Sembuh : ${ConvertPrice(hs.totalRecovered).getIdr()}",
                        style: TextStyle(
                            color: AppTheme.colors['putih'],
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.group,
                        color: AppTheme.colors['putih'],
                      ),
                      Padding(padding: EdgeInsets.only(left: 8)),
                      Text(
                        hs.loadingVirus
                            ? "loading.."
                            : "Meninggal : ${ConvertPrice(hs.totalDeath).getIdr()}",
                        style: TextStyle(
                            color: AppTheme.colors['putih'],
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                        maxLines: 1,
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _title() {
    return Container(
        margin: EdgeInsets.only(left: 16, bottom: 16),
        child: Text(
          "NEGARA TERDAMPAK",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ));
  }

  _item(DataCountry country, AllCountryState hs, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppTheme.colors['biru_box'],
          border: Border.all(
            color: AppTheme.colors['biru_box'],
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      padding: EdgeInsets.only(right: 8, left: 8),
      margin: EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
              'https://www.countryflags.io/${new CountryToCode(country.countryRegion).getCode().toLowerCase()}/flat/64.png'),
          Padding(padding: EdgeInsets.only(left: 16)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  country.countryRegion ?? "",
                  style: TextStyle(
                      fontSize: 17,
                      color: AppTheme.colors['putih'],
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(top: 8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "${ConvertPrice(country.confirmed).getIdr()} Kasus",
                      style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.colors['putih'],
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${ConvertPrice(country.recovered).getIdr()} Sembuh",
                      style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.colors['putih'],
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
