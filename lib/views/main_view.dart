/*
 * corona
 * main_view.dart
 * Created by Cong Fandi on 2/4/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'package:corona/providers/main_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainState ms = Provider.of<MainState>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.flag), title: Text("Indonesia")),
          BottomNavigationBarItem(
              icon: Icon(Icons.show_chart), title: Text("Statistik")),
        ],
        onTap: ms.setPage,
        currentIndex: ms.currentPage,
      ),
      body: ms.pages[ms.currentPage],
    );
  }
}
