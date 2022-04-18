import 'package:flutter/material.dart';
import 'package:niceroom/pages/home/info/index.dart';
import 'package:niceroom/pages/home/tab_index/index_navigator.dart';
import 'package:niceroom/pages/home/tab_index/index_recommend.dart';
import 'package:niceroom/widgets/common_swipper.dart';
import 'package:niceroom/widgets/search_bar/index.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //去掉返回键
        title: const SearchBar(
          shwoLocation: true,
          showMap: true,
          onSearch: true,
        ),
      ),
      body: ListView(children: const [
        CommonSwiper(),
        IndexNavigator(),
        IndexRecomment(),
        Info(),
        Text('这是内容区域'),
      ]),
    );
  }
}
