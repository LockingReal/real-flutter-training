import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterapp2/route/application.dart';
import '../pages/tabbar/index_page.dart';
import '../pages/tabbar/email_screen.dart';
import '../pages/tabbar/pages_screen.dart';
import '../pages/tabbar/airplay_screen.dart';
import '../redux/index_state.dart';
import 'package:redux/redux.dart';
import '../redux/index_redux.dart';
import 'package:flutter/scheduler.dart';
import 'package:package_info/package_info.dart';
import 'package:device_info/device_info.dart';
import '../utils/common/common_utils.dart';
class MainWidget extends StatefulWidget {
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  final _BottomNavigationColor = Colors.amberAccent;
  TabController tabController;
  int _currentIndex = 0;
  List<Widget> tabbarList = List();
  Store store;
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  Store<IndexState> _getStore() {
    if (context == null) {
      return null;
    }
    return StoreProvider.of(context);
  }

  @override
  void initState() {
    tabbarList
      ..add(IndexPage())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(AirplayScreen());
    tabController = TabController(length: 6, vsync: this);
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) => {
          print(_getStore().state.login),
          new Future.delayed(Duration(seconds: 3), () {
            _getStore().dispatch(LoginSuccessAction(context, true));
            _initPackageInfo();
            getDeviceInfo();
//        Application.router.navigateTo(context, "/detail");
          })
        });
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    print('打印设备信息');
    print(info.appName);
    print(info.buildNumber);
    print(info.packageName);
    print(info.version);
    setState(() {
      _packageInfo = info;
    });
  }

  Future<void> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
    if(Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print(androidInfo);
      Map ainfo = CommonUtils.readAndroidBuildData(androidInfo);
      _getStore().dispatch(RefreshAction(context,ainfo));
//      print(CommonUtils.readAndroidBuildData(androidInfo).toString());
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//      print(CommonUtils.readIosDeviceInfo(iosInfo).toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: this._currentIndex, children: tabbarList),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.amberAccent,
          unselectedItemColor: Colors.white,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.amberAccent,
              ),
              title: Text('首页'),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.explore,
                  color: Colors.amberAccent,
                ),
                title: Text('找课')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.date_range,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.date_range,
                  color: Colors.amberAccent,
                ),
                title: Text('课程表')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.account_circle,
                  color: Colors.amberAccent,
                ),
                title: Text('我的')),
          ],
          currentIndex: _currentIndex,
          onTap: (int index) {
            print(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed),
    );
  }
}
