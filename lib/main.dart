import 'package:flutter/material.dart';
import './pages/home.dart';
import './redux/index_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './route/routes.dart';
import 'package:fluro/fluro.dart';
import './route/application.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState(){
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
    super.initState();
  }

  final store = new Store<IndexState>(
    appReducer,

    ///拦截器
    middleware: middleware,

    ///初始化数据
    initialState: new IndexState(
      login: false
    )
  );

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: new StoreBuilder<IndexState>(builder: (context, store) {
          return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              onGenerateRoute: Application.router.generator,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home:MainWidget()
          );
        })
    );
  }
}
