import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import '../subpages/index/recommand.dart';
import '../subpages/index/java_index.dart';
import '../../components/card/reclive_card.dart';

class IndexPage extends StatefulWidget {
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with TickerProviderStateMixin {

  TabController tabController;
  TabController tabBottomController;
  List<Widget>subList = List();

  @override
  void initState(){
    subList
      ..add(RecommandWidget())
      ..add(JavaIndexWidget())
      ..add(RecommandWidget())
      ..add(RecommandWidget())
      ..add(RecommandWidget())
      ..add(RecommandWidget())
      ..add(RecommandWidget());
    tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
//    tabBottomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getHttp();
    TextEditingController topSearchController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title:Container(
            alignment: Alignment.center,
            height: 32,
            child: TextField(
              controller: topSearchController,
              maxLines:1,
              style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Roboto'
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: "  搜索老师、机构、课程",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.white,
              ),
              cursorRadius: Radius.circular(5),
              autofocus: false,
            ),
          ),
          centerTitle:true,
          bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.amberAccent,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3.0,
              tabs: [
                Tab(
                    text: "精选推荐"
                ),
                Tab(
                    text: "Java开发"
                ),
                Tab(
                    text: '平面设计'
                ),
                Tab(
                    text: "淘宝营销"
                ),
                Tab(
                    text: "职业技能"
                ),
                Tab(
                    text: '高中'
                ),
                Tab(
                    text: '实用英语'
                )
              ],
              controller: tabController
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                print('search');
              },
            ),
          ],
        ),
        body:TabBarView(
                children: <Widget>[
                  RecommandWidget(),
                  JavaIndexWidget(),
                  RecommandWidget(),
                  JavaIndexWidget(),
                  RecommandWidget(),
                  JavaIndexWidget(),
                  RecommandWidget()
                ],
                controller: tabController
            )
    );
  }




  void getHttp() async {
    try {
      Response response = await Dio().get("https://www.fastmock.site/mock/93b5e880510df4e09dbbe6e2d984c84a/flutter/api/getLessonsList");
//      print(response);
    } catch (e) {
      print(e);
    }
  }
}

class Choice {
  const Choice({ this.title, this.icon });
  final String title;
  final IconData icon;
}
