import 'package:flutter/material.dart';
import 'package:niceroom/pages/home/tab_search/data_list.dart';
import 'package:niceroom/widgets/common_tag.dart';

class RoomListItemWidget extends StatelessWidget {
  final RoomListItemData data;

  const RoomListItemWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('roomDetail/${data.id}');
      },
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 0, bottom: 8),
        child: Row(
          //左右结构使用Row，上下结构使用Column
          children: [
            Image.network(data.imageUrl, width: 132.5, height: 100),
            const Padding(padding: EdgeInsets.only(left: 8)),
            //Expanded使用与类似与Column，Row，Flex等展示多个组件集合的组件，
            //Expanded包含的组件可以占据剩余的空间。
            Expanded(
                child: Column(
              //右边的文字应居左，这里的主轴是上下，交叉轴即左右
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  maxLines: 1, //最大行数，这里只能一行
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  data.subTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Wrap(
                  //引入common_tag组件
                  children: data.tags.map((item) => CommonTag(item)).toList(),
                ),
                Text(
                  '${data.price} 元/月 ',
                  style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
