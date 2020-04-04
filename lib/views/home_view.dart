/*
 * corona
 * home_view.dart
 * Created by Cong Fandi on 2/4/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'package:corona/app/app_theme.dart';
import 'package:corona/providers/indonesia_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  final List<HomeMenu> _listMenu = [
    new HomeMenu(
        icon: 'assets/icons/pantau.png', name: 'Pantau', routeName: '/chart'),
    new HomeMenu(
        icon: 'assets/icons/artikel.png',
        name: 'Artikel',
        routeName: '/artikel'),
    new HomeMenu(
        icon: 'assets/icons/penanganan.png',
        name: 'Penanganan',
        routeName: '/penanganan'),
    new HomeMenu(
        icon: 'assets/icons/rujukan.png',
        name: 'RS Rujukan',
        routeName: '/rujukan'),
    new HomeMenu(
        icon: 'assets/icons/situs_resmi.png',
        name: 'Situs Resmi',
        routeName: '/situs_resmi'),
    new HomeMenu(icon: 'assets/icons/faq.png', name: 'FAQ', routeName: '/faq')
  ];

  _backGround(BuildContext context, IndonesiaState hs) {
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

  _body(BuildContext context, IndonesiaState hs) {
    return RefreshIndicator(
      onRefresh: () => hs.getDetail(),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
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
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  height: MediaQuery.of(context).size.height - 300,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width - 64,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 32,
                                    childAspectRatio: 0.7,
                                    mainAxisSpacing: 8),
                            itemBuilder: (c, i) => _menuItem(_listMenu[i], c),
                            itemCount: _listMenu.length,
                          ),
                        ),
                      ),
                      Image.asset('assets/images/footer.png')
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _menuItem(HomeMenu homeMenu, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, homeMenu.routeName);
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3 - 100,
        height: MediaQuery.of(context).size.width / 3 - 100,
        child: Column(
          children: <Widget>[
            Image.asset(homeMenu.icon),
            Padding(padding: EdgeInsets.only(top: 4)),
            Text(
              homeMenu.name,
              style: TextStyle(color: AppTheme.colors['biru']),
            )
          ],
        ),
      ),
    );
  }

  _header(BuildContext context, IndonesiaState hs) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(32.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 32)),
            Text(
              'INDONESIA',
              style: TextStyle(
                  color: AppTheme.colors['putih'],
                  fontWeight: FontWeight.bold,
                  fontSize: 27),
            ),
            OutlineButton(
              onPressed: null,
              borderSide: BorderSide(width: 4),
              child: Text(
                hs.loadIndonesia
                    ? "loading.."
                    : "${hs.indonesia.positif} Kasus",
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
                        hs.loadIndonesia
                            ? "loading..."
                            : "Sembuh : ${hs.indonesia.sembuh}",
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
                        hs.loadIndonesia
                            ? "loading..."
                            : "Meninggal : ${hs.indonesia.meninggal}",
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

  @override
  Widget build(BuildContext context) {
    final IndonesiaState indonesiaState = Provider.of<IndonesiaState>(context);
    return _backGround(context, indonesiaState);
  }
}

class HomeMenu {
  String icon;
  String name;
  String routeName;

  HomeMenu({this.icon, this.name, this.routeName});
}
