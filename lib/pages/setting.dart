import 'dart:async';

import 'package:flutter/material.dart';
import 'package:niceroom/scoped_model/auth.dart';
import 'package:niceroom/utils/common_toast.dart';
import 'package:niceroom/utils/scoped_model_helper.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: ListView(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
            style: const ButtonStyle(),
            onPressed: () {
              CommonToast.showToast('已经退出登录');
              //退出
              ScopedModelHelper.getModel<AuthModel>(context).logout();
              Timer(const Duration(seconds: 1), () {
                Navigator.of(context).pop(); //回到上一个页面
              });
            },
            child: const Text(
              '退出登录',
              style: TextStyle(),
            ),
          )
        ],
      ),
    );
  }
}
