/*
 * corona
 * login_view.dart
 * Created by Cong Fandi on 6/4/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'package:corona/app/app_theme.dart';
import 'package:corona/providers/login_state.dart';
import 'package:corona/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  _body(BuildContext context, LoginState ls) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'assets/images/background.png',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: 36,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 200,
              child: PageView.builder(
                itemBuilder: (c, i) =>
                    i == 0 ? _firstPage(c) : _pageItem("Halo", "subTitle"),
                itemCount: 4,
              ),
            )),
        Container(
          margin: EdgeInsets.all(36),
          width: MediaQuery.of(context).size.width - 100,
          height: 50,
          child: RaisedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (c) => MainView()));
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
//                Image.asset(
//                  'assets/icons/google-plus.png',
//                  width: 40,
//                  height: 40,
//                ),
                Center(child: Text("Login With Google")),
              ],
            ),
            color: AppTheme.colors['biru_box'],
            textColor: AppTheme.colors['putih'],
          ),
        )
      ],
    );
  }

  _firstPage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Welcome to",
              style: TextStyle(
                  color: AppTheme.colors['putih'],
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Pantau Corona",
              style: TextStyle(
                  color: AppTheme.colors['putih'],
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 8, bottom: 8),
              width: 200,
              height: 2,
              color: AppTheme.colors['putih'],
            ),
            Text(
              "Figth Together\nSafe Togehther",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppTheme.colors['putih'],
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
            ),
            Text(
              "Swipe to see more",
              style: TextStyle(
                  color: AppTheme.colors['putih'],
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  _pageItem(String title, String subTitle) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(title),
          Text(subTitle),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final LoginState ls = Provider.of<LoginState>(context);
    return Scaffold(
      body: _body(context, ls),
    );
  }
}
