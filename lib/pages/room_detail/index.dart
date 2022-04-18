import 'package:flutter/material.dart';

//1.添加无状态组件
class RoomDtailPage extends StatelessWidget {
  final String roomId;

  const RoomDtailPage({Key? key, required this.roomId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //2.引入自定义的组件
    /*当前版本建议使用const*/
    return Scaffold(
      appBar: AppBar(
        title: const Text('房间详情'),
      ),
      body: Center(
        child: Text('房间id:$roomId'),
      ),
    );
  }
}
