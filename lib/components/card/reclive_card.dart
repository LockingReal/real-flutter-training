import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapp2/pages/subpages/index/recommand.dart';
import '../../components/icon/antd_icons.dart';
class RecliveCard extends StatefulWidget {
  _RecliveCardState createState() => _RecliveCardState();
  RecliveCard({Key key, this.lesson}) : super(key: key);
  LiveLesson lesson;
}

class _RecliveCardState extends State<RecliveCard> with SingleTickerProviderStateMixin {
  @override
  void initState(){
    print(widget);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Container(
            height:100,
            margin:EdgeInsets.only(top:2.0),
            padding: EdgeInsets.all(2.0),
            alignment: Alignment(-1,0),
            decoration: BoxDecoration(
                color:Colors.white
            ),
            child: Row(
              mainAxisSize:MainAxisSize.max,
              children: [
                Expanded(
                  flex:1,
                  child:Container(
                      padding:EdgeInsets.all(4.0),
                      margin:EdgeInsets.only(right:2.0) ,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child:Image.network(
                            widget.lesson.lesson_img,
                            fit:BoxFit.fill,
                          )
                      )
                  ),
                ),
                Expanded(
                  flex:1,
//                                padding: EdgeInsets.all(2.0),
                  child:Column(
//                                  margin:EdgeInsets.fromLTRB(0,4.0,0,4.0),
                    children: [
                      Expanded(
                        flex:3,
                        child: Container(
                            margin:EdgeInsets.only(top:4.0),
                            child:Text(
                              widget.lesson.lesson_name,
                              maxLines:2,
                              overflow: TextOverflow.ellipsis,
                              style:TextStyle(
                                  color:Colors.black54,
                                  fontSize:12,
                                  fontWeight:FontWeight.w600
                              ),
                            )),
                      ),
                      Expanded(
                          flex:1,
                          child:Row(
                              children:[
                                Icon(
                                    AntdIcons.star,
                                    size: 14,
                                    color: Colors.red
                                ),
                                Container(
                                  margin:EdgeInsets.only(left:2.0),
                                  child:Text(
                                    "最近人气 3万+",
                                    maxLines:1,
                                    overflow: TextOverflow.ellipsis,
                                    style:TextStyle(
                                      color:Colors.black54,
                                      fontSize:12,
                                      fontWeight:FontWeight.w600,
                                    ),
                                  ),
                                )
                              ]
                          )
                      )
                    ],
                  ),
                )
              ],
            )
          )
    );
  }
}
