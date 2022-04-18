import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

const List<String> defaultImages = [
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn75.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg',
];
// 图片宽 750px 高 424px
// 设置图片的宽高(为了代码易于阅读)
var imageHeight = 750.0;
var imageWidth = 424.0;

class CommonSwiper extends StatelessWidget {
  final List<String> images;
  const CommonSwiper({Key? key, this.images = defaultImages}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //适配不同屏幕
    var height = MediaQuery.of(context).size.width / imageHeight * imageWidth;
    return SizedBox(
      // height: 212.0,
      height: height, //必须设置一个高度

      //flutter_swiper使用的核心代码
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          //使用网络图片
          return Image.network(
            images[index],
            fit: BoxFit.fill,
          );
        },
        autoplay: true,
        itemCount: images.length, //图片数量
        // scrollDirection: Axis.vertical,
        pagination: const SwiperPagination(
            alignment: Alignment.bottomCenter), //底部居中的提示的点点
        // control: const SwiperControl(), //显示左还是右的尖尖
      ),
    );
  }
}
