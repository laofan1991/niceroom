import 'package:flutter/material.dart';
import 'package:niceroom/pages/home/info/index.dart';
import 'package:niceroom/widgets/search_bar/index.dart';
// import 'package:niceroom/widget/search_bar/index.dart';

class TabInfo extends StatefulWidget {
  const TabInfo({Key? key}) : super(key: key);

  @override
  _TabInfoState createState() => _TabInfoState();
}

class _TabInfoState extends State<TabInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const SearchBar(),
        title: const SearchBar(
          onSearch: true,
        ),
        // backgroundColor: Colors.white,
      ),
      body: ListView(
        children: const [
          Padding(padding: EdgeInsets.only(top: 8)),
          //把Info页面引入进来
          Info(),
        ],
      ),
    );
  }
}
