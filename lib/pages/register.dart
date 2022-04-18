import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:niceroom/config.dart';
import 'package:niceroom/routes.dart';
import 'package:niceroom/utils/common_toast.dart';
import 'package:niceroom/utils/dio_http.dart';
import 'package:niceroom/utils/string_is_null_or_empty.dart';

//添加无状态组件->更新为组态组件
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //接收页面提交的三个参数
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var repeatPasswordController = TextEditingController();

  _registerHandler() async {
    var username = usernameController.text;
    var password = passwordController.text;
    var repeatPassword = repeatPasswordController.text;
    if (password != repeatPassword) {
      CommonToast.showToast('密码不一致');
      return;
    }
    if (StringIsNullOrEmpty(username) || StringIsNullOrEmpty(password)) {
      CommonToast.showToast('请输入用户名或密码');
      return;
    }

    //发送请求
    const url = '/registerTest';
    var params = {"username": username, "password": password};
    var res = await DioHttp.of(context).post(url, params);
    //解码
    var resArr = json.decode(res.toString());

    int status = resArr['code'];
    String msg = resArr['msg'] ?? '内部错误';
    CommonToast.showToast(msg);

    if (status == 0) {
      //跳转到登录页
      Navigator.of(context).pushReplacementNamed('login');
    }
  }

  _testHandler() async {
    print(Config.BaseUrl);
    var dio = Dio();
    final response = await dio.get(Config.BaseUrl);
    print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    //引入自定义的组件
    /*当前版本建议使用const*/

    // return const PageContent(
    //   name: '登录',
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text('注册'),
      ),
      body: SafeArea(
        //5.异形屏优化SafeArea
        minimum: const EdgeInsets.all(20), //6.整个页面往里面缩
        child: ListView(
          //ListView对比Column，ListView在局部可以滚动
          children: [
            //1.手机号
            TextField(
              controller: usernameController,
              autocorrect: true, //获取光标
              keyboardType: TextInputType.phone, //键盘样式
              decoration: const InputDecoration(
                  //input样式
                  prefixIcon: Icon(Icons.mobile_screen_share),
                  labelText: '手机号',
                  hintText: '请输入手机号'),
              maxLength: 11,
            ),
            //2.密码
            TextField(
              controller: passwordController,
              obscureText: true, //开启密码框
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.code_outlined),
                  labelText: '密码',
                  hintText: '请输入密码'),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: repeatPasswordController,
              obscureText: true, //开启密码框
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.code_outlined),
                  labelText: '确认密码',
                  hintText: '请确认密码'),
            ),
            const Padding(padding: EdgeInsets.all(20)),
            //3.点击登录
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    _testHandler();
                    _registerHandler();
                  },
                  child: const Text('点击注册')),
            ),
            //4.去注册
            Row(
              mainAxisAlignment: MainAxisAlignment.center, //居中
              children: [
                const Text('已有账号，'),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.login);
                    },
                    child: const Text('去登录~'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
