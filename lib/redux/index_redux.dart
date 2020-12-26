import 'package:flutter/material.dart';
import './index_state.dart';
import '../model/User.dart';
import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';
import 'middleware/epic_store.dart';
/**
 * 用户相关Redux
 * Created by guoshuyu
 * Date: 2018-07-16
 */

/// redux 的 combineReducers, 通过 TypedReducer 将 UpdateUserAction 与 reducers 关联起来
final LoginReducer = combineReducers<bool>([
  TypedReducer<bool, LoginSuccessAction>(_loginResult),
  TypedReducer<bool, LogoutAction>(_logoutResult),
]);

final platformReducer = combineReducers<Map>([
  TypedReducer<Map,RefreshAction>(_platformMap)
]);

bool _loginResult(bool result, LoginSuccessAction action) {
  if (action.success == true) {
//    NavigatorUtils.goHome(action.context);
  }
  return action.success;
}

bool _logoutResult(bool result, LogoutAction action) {
  return true;
}

Map _platformMap(Map platformInfo,RefreshAction action){
  return platformInfo;
}

class LoginSuccessAction {
  final BuildContext context;
  final bool success;

  LoginSuccessAction(this.context, this.success);
}

class LogoutAction {
  final BuildContext context;

  LogoutAction(this.context);
}

class LoginAction {
  final BuildContext context;
  final String username;
  final String password;

  LoginAction(this.context, this.username, this.password);
}


class LoginMiddleware implements MiddlewareClass<IndexState> {
  @override
  void call(Store<IndexState> store, dynamic action, NextDispatcher next) {
    if (action is LogoutAction) {
    }
    // Make sure to forward actions to the next middleware in the chain!
    next(action);
  }
}

Stream<dynamic> loginEpic(Stream<dynamic> actions, EpicStore<IndexState> store) {
  Stream<dynamic> _loginIn(
      LoginAction action, EpicStore<IndexState> store) async* {
    yield LoginSuccessAction(action.context,true);
  }
  return actions
      .whereType<LoginAction>()
      .switchMap((action) => _loginIn(action, store));
}
class RefreshAction {
  final BuildContext context;
  final Map platformInfo;
  RefreshAction(this.context,this.platformInfo);
}