import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../services/ScreenAdaper.dart';

class EmailScreen extends StatefulWidget {
  EmailScreen({Key key}) : super(key: key);

  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen>  with AutomaticKeepAliveClientMixin{
  int _selectIndex = 0;
  List _leftCateList = [];
  List _rightCateList = [];
  List<Map> showList = [];
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _getLeftCateData();
    _initRightData();
  }

  //左侧数据：
  _getLeftCateData() async {
    var leftCateList = [
      "IT","设计","电商","职业","升学",
      "兴趣","语言"
    ];
    setState(() {
      this._leftCateList = leftCateList;
    });
  }
  _initRightData() async{
    List<Map> rightCateList = [
      { 'title': 'java', 'imgUrl': 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Faliyunzixunbucket.oss-cn-beijing.aliyuncs.com%2Fjpg%2F7a06862c0d321103e59830b1a072a831.jpg%3Fx-oss-process%3Dimage%2Fresize%2Cp_100%2Fauto-orient%2C1%2Fquality%2Cq_90%2Fformat%2Cjpg%2Fwatermark%2Cimage_eXVuY2VzaGk%3D%2Ct_100&refer=http%3A%2F%2Faliyunzixunbucket.oss-cn-beijing.aliyuncs.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1611457854&t=12c43c8ac219db69733b8301dd80a7ac' },
      {'title': 'java', 'imgUrl': 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Faliyunzixunbucket.oss-cn-beijing.aliyuncs.com%2Fjpg%2F7a06862c0d321103e59830b1a072a831.jpg%3Fx-oss-process%3Dimage%2Fresize%2Cp_100%2Fauto-orient%2C1%2Fquality%2Cq_90%2Fformat%2Cjpg%2Fwatermark%2Cimage_eXVuY2VzaGk%3D%2Ct_100&refer=http%3A%2F%2Faliyunzixunbucket.oss-cn-beijing.aliyuncs.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1611457854&t=12c43c8ac219db69733b8301dd80a7ac' }
    ];
    print(rightCateList);
    List l = new List();
    l.add(rightCateList);
    setState(() {
      this._rightCateList = l;
    });
  }
  //右侧数据：
  _getRightCateData(pid) async {
    print('_getRightCateData pid');
    print(pid);
    var rlen = this._rightCateList.length;
    if(rlen>0){
      if(pid<=rlen-1){
        List<Map> showCateList  = this._rightCateList[pid];
        setState(() {
          this.showList = showCateList;
        });
      }else{
        setState(() {
          this.showList = [];
        });
      }
    }
  }
  //左侧组件
  Widget _leftCateWidget(leftWidth) {
    if (this._leftCateList.length > 0) {
      return Container(
        width: leftWidth,
        height: double.infinity,
        // color: Colors.red,
        child: ListView.builder(
          itemCount: this._leftCateList.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      // setState(() {
                      _selectIndex = index;
                      print("selectIndex");
                      print(_selectIndex);
                      this._getRightCateData(this._selectIndex);
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    alignment:Alignment.center,
                    height: ScreenAdaper.height(80),
                    decoration:BoxDecoration(
                      border:_selectIndex == index?Border(
                        left:BorderSide(
                          width:2,
                          color: Colors.black54//边框颜色
                        )
                      ):null,
                        color: _selectIndex == index
                            ? Color.fromRGBO(240, 246, 246, 0.9)
                            : Colors.white
                    ),
                    child: Text("${this._leftCateList[index]}",
                        textAlign: TextAlign.center)

                  ),
                ),
                Divider(height: 1),
              ],
            );
          },
        ),
      );
    } else {
      return Container(
        width: leftWidth,
        height: double.infinity,
      );
    }
  }

  //右侧组件：
  Widget _rightCateWidget(rightItemWidth, rightItemHeigth) {
    print("showList");
//    print(this.showList[0]);
    print(this.showList.length);
    if (this.showList.length > 0) {
      return Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.all(10),
          height: double.infinity,
          color:Colors.red,
//          color: Color.fromRGBO(240, 246, 246, 0.9),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: rightItemWidth / rightItemHeigth,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: this.showList.length,
            itemBuilder: (context, index) {
              //处理图片：
              Map item = this.showList[index];
              print(item);
//              String pic=this._rightCateList[index].pic;
//              pic=Config.domain+pic.replaceAll('\\','/');
              return Container(
                padding: EdgeInsets.all(ScreenAdaper.width(20)),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: ScreenAdaper.height(32),
                      child: Text("11")
                    )
                  ],
                ),
              );
            },
          ),
        ),
      );
    } else {
      return Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(10),
            height: double.infinity,
            color: Color.fromRGBO(240, 246, 246, 0.9),
            child: Text('加载中...'),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdaper.init(context);

    //计算右侧GridView宽高比：
    var leftWidth = ScreenAdaper.getScreenWidth() / 4;
    //右侧宽高=总宽度-左侧宽度-Gridview外层元素左右的Padding值-GridView中间的间距
    var rightItemWidth =
        (ScreenAdaper.getScreenWidth() - leftWidth - 20 - 20) / 3;
    rightItemWidth = ScreenAdaper.width(rightItemWidth);
    var rightItemHeigth = rightItemWidth + ScreenAdaper.height(32);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:Container(
          alignment: Alignment.center,
          height: 32,
          child: TextField(
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              print('search');
            },
          ),
        ],
      ),
      body:Row(
        children: <Widget>[
          _leftCateWidget(leftWidth),
          _rightCateWidget(rightItemWidth, rightItemHeigth)
        ],
      )
    );
  }
}

class CateItem {
  const CateItem({ this.main_title });
  final String main_title;
}

class SCateItem{
  final String title;
  final String imgUrl;

  const SCateItem({this.title,this.imgUrl});
}
