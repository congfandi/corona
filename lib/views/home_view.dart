/*
 * corona
 * home_view.dart
 * Created by Cong Fandi on 15/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'package:corona/app/app.dart';
import 'package:corona/app/app_theme.dart';
import 'package:corona/helper/contry_to_code.dart';
import 'package:corona/helper/convert_price.dart';
import 'package:corona/models/viruses/Virus.dart';
import 'package:corona/providers/home_state.dart';
import 'package:corona/views/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeState(),
      child: Consumer<HomeState>(builder: (context, hs, _) {
        return Scaffold(
          body: _backGround(context, hs),
        );
      }),
    );
  }

  _backGround(BuildContext context, HomeState hs) {
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
              'assets/background.jpeg',
              fit: BoxFit.fill,
            ),
          ),
          hs.loadingVirus
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : _body(context, hs),
        ],
      ),
    );
  }

  _body(BuildContext context, HomeState hs) {
    return RefreshIndicator(
      onRefresh: () {
        hs.getListVirus();
        return;
      },
      child: Column(
        children: <Widget>[
          _header(context, hs),
          Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppTheme.colors['putih'],
                border: Border.all(
                  color: AppTheme.colors['putih'],
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            height: MediaQuery.of(context).size.height - 250,
            child: ListView.builder(
              itemBuilder: (c, i) =>
                  i == 0 ? _title() : _item(hs.listVirus[i - 1], hs, context),
              itemCount: hs.listVirus.length + 1,
            ),
          )
        ],
      ),
    );
  }

  _header(BuildContext context, HomeState hs) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(32.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 32)),
            Text(
              hs.pinnedVirus == null
                  ? "wait..."
                  : hs.pinnedVirus.attributes.country_Region.toUpperCase(),
              style: TextStyle(
                  color: AppTheme.colors['putih'],
                  fontWeight: FontWeight.bold,
                  fontSize: 27),
            ),
            OutlineButton(
              onPressed: null,
              borderSide: BorderSide(width: 4),
              child: Text(
                hs.pinnedVirus == null
                    ? "wait.."
                    : "${ConvertPrice(hs.pinnedVirus.attributes.confirmed).getIdr()} Kasus",
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
                        hs.pinnedVirus == null
                            ? "loading.."
                            : "Sembuh : ${ConvertPrice(hs.pinnedVirus.attributes.recovered).getIdr()}",
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
                    children: <Widget>[
                      Icon(
                        Icons.group,
                        color: AppTheme.colors['putih'],
                      ),
                      Padding(padding: EdgeInsets.only(left: 8)),
                      Text(
                        hs.pinnedVirus == null
                            ? "loading.."
                            : "Meninggal : ${ConvertPrice(hs.pinnedVirus.attributes.deaths).getIdr()}",
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

  _item(Virus virus, HomeState hs, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => DetailView(hs,virus)));
      },
      child: Container(
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
                'https://www.countryflags.io/${new CountryToCode(virus.attributes.country_Region).getCode().toLowerCase()}/flat/64.png'),
            Padding(padding: EdgeInsets.only(left: 16)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    virus.attributes.country_Region ?? "",
                    style: TextStyle(
                        fontSize: 17,
                        color: AppTheme.colors['putih'],
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${ConvertPrice(virus.attributes.confirmed).getIdr()} Kasus",
                    style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.colors['putih'],
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: hs.pinnedVirus == virus
                      ? AppTheme.colors['putih']
                      : AppTheme.colors['abu_abu'],
                ),
                onPressed: () {
                  hs.setPinnedVirus(virus);
                })
          ],
        ),
      ),
    );
  }
}
