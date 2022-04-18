import 'package:flutter/material.dart';

//1.添加无状态组件
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //2.引入自定义的组件
    /*当前版本建议使用const*/
    return Scaffold(
      appBar: AppBar(
        title: const Text('404'),
      ),
      body: const Center(
        child: Text('您访问的页面不存在'),
      ),
    );
  }
}
