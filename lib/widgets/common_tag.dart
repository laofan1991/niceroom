import 'package:flutter/material.dart';

class CommonTag extends StatelessWidget {
  final String title;
  final Color color;
  final Color backgroundColor;

  //命名构造函数
  const CommonTag.origin(
      {Key? key,
      required this.title,
      this.color = Colors.black,
      this.backgroundColor = Colors.grey})
      : super(key: key);

  //factory
  //当你需要构造函数不是每次都创建一个新的对象时，使用factory关键字。
  factory CommonTag(String title) {
    switch (title) {
      case '近地铁':
        return CommonTag.origin(
          title: title,
          color: Colors.red,
          backgroundColor: Colors.red.shade100,
        );
      case '随时看房':
        return CommonTag.origin(
          title: title,
          color: Colors.green,
          backgroundColor: Colors.green.shade100,
        );
      case '集中供暖':
        return CommonTag.origin(
          title: title,
          color: Colors.teal,
          backgroundColor: Colors.teal.shade100,
        );
      case '新上':
        return CommonTag.origin(
          title: title,
          color: Colors.pink,
          backgroundColor: Colors.pink.shade100,
        );
      default:
        return CommonTag.origin(title: title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.only(right: 5, left: 5, top: 1, bottom: 1),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.0)), //圆角边框
      child: Text(
        title,
        style: TextStyle(fontSize: 12.0, color: color),
      ),
    );
  }
}
