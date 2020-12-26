import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../services/ScreenAdaper.dart';

class PagesScreen extends StatefulWidget {
  _PagesScreenState createState() => _PagesScreenState();
}

class _PagesScreenState extends State<PagesScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(children: [
      Container(
          height: ScreenAdaper.height(260.0),
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1204663189,2166792605&fm=26&gp=0.jpg'),
                  fit: BoxFit.cover)),
          child: ListView(shrinkWrap: true, children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10.0, bottom: 4.0),
//                        padding:EdgeInsets.only(top:20.0),
              child: Stack(fit: StackFit.loose, children: [
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text("课程表",
                        style: new TextStyle(
                            fontSize: 18.0, color: Colors.white))),
                Positioned(
                    top: 2.0,
                    right: 14.0,
                    child: Icon(Icons.video_library,
                        size: 30, color: Colors.white))
              ]),
              height: ScreenAdaper.height(80.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: new EdgeInsets.all(10.0),
                      child: ListView(shrinkWrap: true, children: [
                        Text("今日学习",
                            textAlign: TextAlign.center,
                            strutStyle: StrutStyle(
                                forceStrutHeight: true, height: 1, leading: 1),
                            style: TextStyle(
                                color: Colors.amberAccent, fontSize: 14.0)),
                        Text("0 分钟",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.amberAccent, fontSize: 18.0))
                      ]),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                        padding: new EdgeInsets.all(10.0),
                        child: ListView(shrinkWrap: true, children: [
                          Text(
                            "今日学习",
                            textAlign: TextAlign.center,
                            strutStyle: StrutStyle(
                                forceStrutHeight: true, height: 1, leading: 1),
                            style: TextStyle(
                                color: Colors.amberAccent, fontSize: 14.0),
                          ),
                          Text(
                            "0 分钟",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.amberAccent, fontSize: 18.0),
                          )
                        ]))),
                Expanded(
                    flex: 1,
                    child: Container(
                        padding: new EdgeInsets.all(10.0),
                        child: ListView(shrinkWrap: true, children: [
                          Text("今日学习",
                              textAlign: TextAlign.center,
                              strutStyle: StrutStyle(
                                  forceStrutHeight: true,
                                  height: 1,
                                  leading: 1),
                              style: TextStyle(
                                  color: Colors.amberAccent, fontSize: 14.0)),
                          Text("0 分钟",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.amberAccent, fontSize: 18))
                        ])))
              ],
            )
          ]))
    ])));
  }
}
