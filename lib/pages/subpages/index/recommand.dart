import 'dart:ffi';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapp2/model/lesson.dart';
import 'package:flutterapp2/route/application.dart';
import '../../../utils/net/api.dart';
import '../../../components/card/reclive_card.dart';

class RecommandWidget extends StatefulWidget {
  _RecommandWidgetState createState() => _RecommandWidgetState();
}

class _RecommandWidgetState extends State<RecommandWidget> with SingleTickerProviderStateMixin {
  String data = "";
  List _imageUrls=[
    'https://p.qpic.cn/qqconadmin/0/02d64d9d9738413cb1a0f601312f358d/0',
    'https://p.qpic.cn/qqconadmin/0/93d8779e398942f088f9f590e3bf4f79/0?tp=webp',
    'https://p.qpic.cn/qqconadmin/0/800a6ca7f91e43d88cff9c2d7e3a9988/0?tp=webp',
    'https://p.qpic.cn/qqconadmin/0/5944728701744753be3b0db3e6528706/0?tp=webp',
  ];
  List liveList = List();
  List _imageUrls2 = [
    'https://10.idqqimg.com/qqcourse_logo_ng/ajNVdqHZLLAOm8QBYib4ib1wBM4BN8IYdMck8VWgXcUd4HCjdT6fnicVmKK28DwauPVA8WWtfKgLD4/356',
    'https://10.idqqimg.com/qqcourse_logo_ng/ajNVdqHZLLARL7Qs1cn2lNibFCQ8KPZQibsNszgb21BnxsPY1Usj8kOJPweNkMTz9efmTicvjeFCKo/356',
    'https://10.idqqimg.com/qqcourse_logo_ng/ajNVdqHZLLBpMyJRgFywmEXZDttZiapiaap012vGhUCustGq8liburYHTeOXF3EbIv7KRx5NCkKm1o/356',
    'https://10.idqqimg.com/qqcourse_logo_ng/ajNVdqHZLLCeiaa4Ru3D1Cnk5HV7Nas1XRMl1ibvF2LbcB7mYIbYxaXibjz1syNOPdWn1Ye58VpkwA/356'
  ];

  @override
  void initState(){
    liveList
      ..add(
          new LiveLesson("CAD教程零基础入门到精通CAD制图CAD绘图CAD视频CAD2018CAD自学","https://10.idqqimg.com/qqcourse_logo_ng/ajNVdqHZLLB3IzJEKwQzb6Umw63JDlk9BbzhzCODXcCXxRbV88zjVgRI67635zT78NbY60AzWDs/356")
      )
      ..add(
        new LiveLesson("【全套】Excel/WPS零基础入门(电子表格)小白脱白系列","https://10.idqqimg.com/qqcourse_logo_ng/ajNVdqHZLLBEMLFzic0702YlB52MZdRvGTVNwyKzja6Yy40U7rZBMaya3JiaiaU4plFRRdxyZzAnoM/356")
      );
    new Future.delayed(Duration(seconds: 1),(){
      // 1.构建URL

//      response.toString();
//      print(user["code"]);
//      var dataValue = json.decode(result);
//      final
      // 2.发送网络请求获取结果
//      final result = await FRequest.request(requestUrl);

//      liveList.add( new LiveLesson("CAD教程零基础入门到精通CAD制图CAD绘图CAD视频CAD2018CAD自学","https://10.idqqimg.com/qqcourse_logo_ng/ajNVdqHZLLB3IzJEKwQzb6Umw63JDlk9BbzhzCODXcCXxRbV88zjVgRI67635zT78NbY60AzWDs/356"));
//      setState(() {
//        liveList = liveList;
//      });
    getLessonsList();
    });
    super.initState();
  }

  void onDataChange(val) {
    setState(() {
      data = val;
    });
  }
  void getLessonsList() async{
    var response = await HttpUtil().get("/getLessonsList");
    print('11111'+response.toString());
    Map<String, dynamic> r = json.decode(response.toString());
    List lessonList = r['data']['lesson_list'];
    lessonList..forEach((ele) {
//      Lesson l = new Lesson(ele.lessonName,ele.lessonImg);
      print('ele的类型');
      var a  = new Lesson.fromJson(ele);
      print(a.runtimeType);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
            child:ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  height: 180,
                  padding: EdgeInsets.all(17.0),
                  decoration: BoxDecoration(
                      color:Colors.black
                  ),
                  child: Swiper(
                    itemCount: _imageUrls.length,
                    autoplay: true,
                    itemBuilder: (BuildContext context,int index){
                      return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child:Image.network(
                            _imageUrls[index],
                            fit:BoxFit.fill,
                          )
                      );
                    },
                    pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                            color: Color.fromRGBO(200, 200, 200, 0.5),
                            size: 8.0,
                            activeSize: 10.0,
                            activeColor:  Colors.white
                        )
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal:17.0),
                    decoration: BoxDecoration(
                        color:Colors.white
                    ),
                    child:ListView(
                        scrollDirection:Axis.vertical,
                        shrinkWrap: true,
                        children:<Widget> [
                          Container(
                            height:40,
                            margin: EdgeInsets.only(top:4.0),
                            padding: EdgeInsets.all(2.0),
                            alignment: Alignment(-1,0),
                            decoration:BoxDecoration(
                                color:Colors.white
                            ),
                            child:Text(
                              "直播好课",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color:Colors.black,
                                  fontSize:18,
                                  letterSpacing: 2
                              ),
                            ),
                          ),
                          Column(
                              children:liveList.map((value) {
                                return RecliveCard(lesson:value);
                              }).toList()
                          )
                        ]
                    )
                ),
                Container(
                    margin: EdgeInsets.only(top:4.0),
                    padding: EdgeInsets.fromLTRB(17,4,17,4),
                    alignment: Alignment(-1,0),
                    child:Text(
                    "年末大礼包",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color:Colors.black,
                          fontSize:18,
                          letterSpacing: 2
                      ),
                    ),
                ),
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: _imageUrls2.length,
                    padding: EdgeInsets.all(16),
                    physics: new NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing:5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          child:Container(
                            decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(_imageUrls2[index]),
                                  fit: BoxFit.cover
                                )
                            ),
                        ),
                        onTap:(){
                            Application.router.navigateTo(context,'detail');
                        },
                      );
                    }
                )
              ],
            ),

        )
    );
  }
}

class LiveLesson{
  String lesson_name;
  String lesson_img;

  LiveLesson(this.lesson_name,this.lesson_img);
}