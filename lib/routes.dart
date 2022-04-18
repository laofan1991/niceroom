import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:niceroom/pages/home/index.dart';
import 'package:niceroom/pages/loading.dart';
import 'package:niceroom/pages/login.dart';
import 'package:niceroom/pages/not_found.dart';
import 'package:niceroom/pages/register.dart';
import 'package:niceroom/pages/room_detail/index.dart';
import 'package:niceroom/pages/setting.dart';

class Routes {
  //1.定义路由名称
  static String home = "/";
  static String login = "/login";
  static String register = "/register";
  static String roomDetail = "/room/:roomId";
  static String setting = "/setting";
  static String loading = "/loading";

  //2.定义路由处理函数
  static final Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const HomePage();
  });
  static final Handler _loginHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const LoginPage();
  });
  static final Handler _registerHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const RegisterPage();
  });
  static final Handler _notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const NotFoundPage();
  });
  static final Handler _roomDetailHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return RoomDtailPage(
      roomId: params['roomId']![0], //这里注意
    );
  });
  static final Handler _settingHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const SettingPage();
  });
  static final Handler _loadingHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return LoadingPage();
  });

  //3.编写路由处理函数
  static void configureRoutes(FluroRouter router) {
    // router.notFoundHandler = Handler(
    //     handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    //   print("ROUTE WAS NOT FOUND !!!");
    //   return;
    // });

    router.define(home, handler: _homeHandler);
    router.define(login, handler: _loginHandler);
    router.define(register, handler: _registerHandler);
    router.define(roomDetail, handler: _roomDetailHandler);
    router.define(setting, handler: _settingHandler);
    router.define(loading, handler: _loadingHandler);
    router.notFoundHandler = _notFoundHandler;
  }
}
