// 配置路径Route
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../route/route_handlers.dart';
import '../pages/subpages/detail/detail.dart';

class Routes {
  // 路由管理
  static FluroRouter router;

  static String root = '/'; // 根目录
  static String detail = '/detail'; // 设置页

  // 配置route
  static void configureRoutes(FluroRouter router) {
    // 未发现对应route
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context,Map<String,List<String>> params){
          print('ERROR====>ROUTE WAS NOT FONUND!!!');
        }
    );
    router.define(detail, handler: detailsHandler);
  }

//  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
//  static Future navigateTo(BuildContext context, String path, {Map<String, dynamic> params, TransitionType transition = TransitionType.native}) {
//    String query =  "";
//    if (params != null) {
//      int index = 0;
//      for (var key in params.keys) {
//        var value = Uri.encodeComponent(params[key]);
//        if (index == 0) {
//          query = "?";
//        } else {
//          query = query + "\&";
//        }
//        query += "$key=$value";
//        index++;
//      }
//    }
//    print('我是navigateTo传递的参数：$query');
//
//    path = path + query;
//    return router.navigateTo(context, path, transition:transition);
//  }
}