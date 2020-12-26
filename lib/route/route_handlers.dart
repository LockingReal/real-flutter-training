import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../pages/subpages/detail/detail.dart';

Handler detailsHandler = Handler(
    handlerFunc: (BuildContext context,Map<String,List<String>> params){
//      String goodsId = params['id'].first;
//      print('index>details goodsID is ${goodsId}');
      print("进入handle");
      return DetailWidget();
    }
);

