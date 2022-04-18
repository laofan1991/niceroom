import 'package:flutter/material.dart';
import 'package:niceroom/routes.dart';

//1.添加无状态组件
class PageContent extends StatelessWidget {
  //2.添加name参数，顶部导航的名称
  final String name;
  //3.加入构造函数中
  /*当前版本要使用required*/
  const PageContent({Key? key, required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //4.加入Scaffold
    return Scaffold(
      //5.加入appBar
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView(
        children: [
          TextButton(
            child: Text(Routes.home),
            onPressed: () {
              //6.跳转
              Navigator.pushNamed(context, Routes.home);
            },
          ),
          TextButton(
            child: Text(Routes.login),
            onPressed: () {
              //6.跳转
              Navigator.pushNamed(context, Routes.login);
            },
          ),
          TextButton(
            child: const Text('/room/888'),
            onPressed: () {
              //6.跳转
              Navigator.pushNamed(context, '/room/888');
            },
          ),
          TextButton(
            child: const Text('/1024'),
            onPressed: () {
              //6.跳转
              Navigator.pushNamed(context, '/aaa');
            },
          ),
          const Padding(padding: EdgeInsetsDirectional.all(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, //居中
            children: [
              Text(
                '当前页面是：$name',
                style: const TextStyle(fontSize: 20, color: Colors.lightBlue),
              ),
            ],
          )
        ],
      ),
    );
  }
}
