import 'package:flutter/material.dart';
import 'package:homeless/screens/home/maps.dart';
import 'package:homeless/screens/home/noti.dart';
import 'package:homeless/screens/home/profile.dart';
import 'package:homeless/theme/spacing.dart';
import 'package:homeless/theme/textStyle.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;

import 'home.dart';

class HomeInitPage extends StatefulWidget {
  const HomeInitPage({super.key});

  @override
  State<HomeInitPage> createState() => _HomeInitPageState();
}

class _HomeInitPageState extends State<HomeInitPage> {
  PageState _currentPage = PageState.Home;
  final List<Widget> pageList = [
    HomePage(),
    NotiPage(),
    MapsPage(),
    ProfilePage()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bg.BackgroundGeolocation.ready(
      bg.Config(
          desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
          distanceFilter: 10.0,
          stopOnTerminate: false,
          startOnBoot: true,
          debug: true,
          logLevel: bg.Config.LOG_LEVEL_VERBOSE),
    ).then((bg.State state) {
      if (!state.enabled) {
        bg.BackgroundGeolocation.start();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      appBar: AppBar(
        leading: Container(),
        leadingWidth: 0,
        title: Text(
          'Homeless',
          style: HomelessTextTheme.xxl
              .copyWith(color: theme.colorScheme.onPrimary),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: pageList.elementAt(_currentPage.index),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy_outlined),
            label: '지원 사업',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: '지원 시설',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '마이페이지',
          ),
        ],
        currentIndex: _currentPage.index,
        onTap: (i) => {
          setState(() {
            _currentPage = PageState.values[i];
          })
        },
        selectedItemColor: theme.colorScheme.onSecondary,
        selectedLabelStyle:
            HomelessTextTheme.xxs.copyWith(fontFamily: "SemiBold"),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedLabelStyle: HomelessTextTheme.xxs,
        unselectedItemColor: theme.colorScheme.onPrimary,
      ),
    );
  }
}

enum PageState { Home, Noti, Map, Profile }
