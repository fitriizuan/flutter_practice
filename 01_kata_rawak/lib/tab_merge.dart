import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
//import 'package:kata_rawak_ii/rndm_word_service.dart';

import 'pages/weird_list.dart';
import 'pages/all_list.dart';
import 'pages/valid_list.dart';

class TabMerger extends StatefulWidget {
  const TabMerger({Key? key}) : super(key: key);

  @override
  _TabMergerState createState() => _TabMergerState();
}

class _TabMergerState extends State<TabMerger> {
  //late TabController _tabController;

  //final RndmWordService _myRndmWordService = RndmWordService();

  int tabIndex = 1;
  List<Widget> pages = <Widget>[];
  @override
  void initState() {
    super.initState();
    pages = [
      WeirdList(),
      AllList(),
      //AllListCopy(),
      ValidList(),
    ];
    //_tabController = TabController(vsync: this, length: pages.length);
  }

//  @override
  bool get wantKeepAlive =>
      true; //by default it will be null, change it to true.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: pages[tabIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
          selectedIconTheme: const IconThemeData(size: 35.0, opacity: 100.0),
          unselectedIconTheme: const IconThemeData(size: 15.0, opacity: 50.0),
          backgroundColor: Colors.white54,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          currentIndex: tabIndex,
          onTap: (int index) {
            setState(() {
              tabIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.sentiment_very_dissatisfied,
                color: Colors.red,
              ),
              //title: Text('Weird List'),
              label: 'Ayat Yang Salah',
            ),
            BottomNavigationBarItem(
                icon:
                    Icon(Icons.sentiment_neutral_rounded, color: Colors.black),
                label: 'Semua Ayat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.sentiment_very_satisfied_rounded,
                    color: Colors.green),
                label: 'Ayat Yang Betul'),
          ],
        ),
      ),
    );
  }
}
