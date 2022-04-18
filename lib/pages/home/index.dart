import 'package:flutter/material.dart';
import 'package:niceroom/pages/home/tab_index/index.dart';
import 'package:niceroom/pages/home/tab_info/index.dart';
import 'package:niceroom/pages/home/tab_prifile/index.dart';
import 'package:niceroom/pages/home/tab_search/index.dart';
// import 'package:niceroom/widgets/page_content.dart';

//1.添加无状态组件
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //2.引入自定义的组件
//     /*当前版本建议使用const*/
//     return const PageContent(
//       name: '首页',
//     );
//   }
// }

//1.需要4个tabView
List tabViewList = [
  const TabIndex(),
  const IndexSearch(),
  const TabInfo(),
  const TabProfile(),
];

//2.需要4个BottomNavigationBarItem
List<BottomNavigationBarItem> barItemList = [
  const BottomNavigationBarItem(label: '首页', icon: Icon(Icons.home)),
  const BottomNavigationBarItem(label: '搜索', icon: Icon(Icons.search)),
  const BottomNavigationBarItem(label: '资讯', icon: Icon(Icons.info)),
  const BottomNavigationBarItem(label: '我的', icon: Icon(Icons.account_circle)),
];

//3.添加无状态组件->更新为状态组件
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //4.引入tabViewList
      body: tabViewList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //5.引入barItemList
        items: barItemList,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        //6.点击时改变index
        onTap: _onItemTapped,
      ),
    );
  }
}
