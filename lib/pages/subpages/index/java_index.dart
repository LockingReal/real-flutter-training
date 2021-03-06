import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

class JavaIndexWidget extends StatefulWidget {
  _JavaIndexWidgetState createState() => _JavaIndexWidgetState();
}

class _JavaIndexWidgetState extends State<JavaIndexWidget> with SingleTickerProviderStateMixin {

  List imgList = [
    "http://yanxuan.nosdn.127.net/65091eebc48899298171c2eb6696fe27.jpg",
    "http://yanxuan.nosdn.127.net/8b30eeb17c831eba08b97bdcb4c46a8e.png",
    "http://yanxuan.nosdn.127.net/a196b367f23ccfd8205b6da647c62b84.png",
    "http://yanxuan.nosdn.127.net/149dfa87a7324e184c5526ead81de9ad.png",
    "http://yanxuan.nosdn.127.net/88dc5d80c6f84102f003ecd69c86e1cf.png",
    "http://yanxuan.nosdn.127.net/8b9328496990357033d4259fda250679.png",
    "http://yanxuan.nosdn.127.net/c39d54c06a71b4b61b6092a0d31f2335.png",
    "http://yanxuan.nosdn.127.net/ee92704f3b8323905b51fc647823e6e5.png",
    "http://yanxuan.nosdn.127.net/e564410546a11ddceb5a82bfce8da43d.png",
    "http://yanxuan.nosdn.127.net/56f4b4753392d27c0c2ccceeb579ed6f.png",
    "http://yanxuan.nosdn.127.net/6a54ccc389afb2459b163245bbb2c978.png",
    'https://picsum.photos/id/101/548/338',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569842561051&di=45c181341a1420ca1a9543ca67b89086&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201504%2F17%2F20150417212547_VMvrj.jpeg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1570437233&di=9239dbc3237f1d21955b50e34d76c9d5&imgtype=jpg&er=1&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201508%2F30%2F20150830095308_UAQEi.thumb.700_0.jpeg'
  ];

  @override
  void initState(){
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body:new StaggeredGridView.countBuilder(
          padding:const EdgeInsets.all(8.0),
          crossAxisCount:4,
          itemCount:imgList.length,
          itemBuilder: (context, i) {
            return itemWidget(i);
          },
          staggeredTileBuilder:(int index)=>
            new StaggeredTile.count(2,index == 0?2.5:3),
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
    );
  }

  Widget itemWidget(int index){
    String imgPath = imgList[index];
    print(imgPath);
    return new Material(
      elevation: 0.8,
      borderRadius: new BorderRadius.all(
        new Radius.circular(8.0)
      ),
      child: new InkWell(
        onTap: (){

        },
        child: new Hero(
          tag: imgPath,
          child: CachedNetworkImage(
              imageUrl: imgPath,
              fit:BoxFit.fitWidth,
              errorWidget: (context, url, error) => new Icon(Icons.error)
          )
        )
      ),
    );
  }
}