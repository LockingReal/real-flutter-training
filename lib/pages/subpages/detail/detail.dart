import 'package:flutter/material.dart';
import '../../../model/node.dart';
import '../../../model/organ.dart';
import '../../../components/others/ImageText.dart';
import 'dart:math';

class  DetailWidget extends StatefulWidget {
  final String title;
  final List<Organ> organs;

  DetailWidget({Key key, this.title,this.organs}) : super(key: key);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget>
    with SingleTickerProviderStateMixin {
  TabController tabController2;

  ///保存所有数据的List
  List<Node> list = new List();
  ///保存当前展示数据的List
  List<Node> expand = new List();
  ///保存List的下标的List，用来做标记用
  List<int> mark = new List();
  ///第一个节点的index
  int nodeId = 1;
  ///展示搜索结构
  bool showSearch = false;
  List<Node> keep;

  @override
  void initState() {
    super.initState();
    this.tabController2 = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            elevation: 0,
            expandedHeight: 250,
            backgroundColor:Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              title:Text('不做美工可惜了'),

              background: Image.network(
                'https://10.idqqimg.com/qqcourse_logo_ng/ajNVdqHZLLAOm8QBYib4ib1wBM4BN8IYdMck8VWgXcUd4HCjdT6fnicVmKK28DwauPVA8WWtfKgLD4/356',
                fit: BoxFit.cover
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyTabBarDelegate(

              child: TabBar(
                labelColor: Colors.black,
                controller: this.tabController2,
                indicatorColor:Colors.black,
                tabs: <Widget>[
                  Tab(text: '课程简介'),
                  Tab(text: '课程目录')
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: this.tabController2,
              children: <Widget>[
                    Text("课程简介的内容"),
                    Text("课程目录的内容")
                ],
            ),
          ),
        ],
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
