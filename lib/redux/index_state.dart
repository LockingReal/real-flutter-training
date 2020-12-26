import 'package:flutter/material.dart';
import '../redux/index_redux.dart';
import 'package:redux/redux.dart';
import '../redux/index_redux.dart';
import 'middleware/epic_middleware.dart';

///全局Redux store 的对象，保存State数据
class IndexState {
  bool login;
  String platform;
  Map platformInfo;
  IndexState({this.login,this.platformInfo});
}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store
IndexState appReducer(IndexState state, action) {
  return IndexState(
    login:LoginReducer(state.login, action),
    platformInfo:platformReducer(state.platformInfo,action)
  );
}

final List<Middleware<IndexState>> middleware = [
  EpicMiddleware<IndexState>(loginEpic),
  LoginMiddleware(),
];
