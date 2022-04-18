import 'package:flutter/material.dart';
import 'package:niceroom/pages/home/info/data.dart';
import 'package:niceroom/pages/home/info/item_widget.dart';

class Info extends StatelessWidget {
  final bool showTitle;
  final List<InfoItem> dataList;

  const Info({Key? key, this.showTitle = false, this.dataList = infoData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showTitle)
          Container(
            padding: const EdgeInsets.only(left: 7),
            alignment: Alignment.centerLeft,
            child: const Text(
              '最新资讯',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
            ),
          ),
        Column(
          //引入ItemWidget组件
          // 所以在这里传入一个 map 值的 item 列表
          children: dataList.map((item) => ItemWidget(data: item)).toList(),
        )
      ],
    );
  }
}
