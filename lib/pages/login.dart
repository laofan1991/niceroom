import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:niceroom/routes.dart';
import 'package:niceroom/scoped_model/auth.dart';
import 'package:niceroom/utils/common_toast.dart';
import 'package:niceroom/utils/dio_http.dart';
import 'package:niceroom/utils/scoped_model_helper.dart';
import 'package:niceroom/utils/store.dart';
import 'package:niceroom/utils/string_is_null_or_empty.dart';

//添加无状态组件->更新为组态组件
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false; //7.添加状态值-是否显示密码

  var usernameController = TextEditingController(); //8.接收账号、密码的TextField
  var passwordController = TextEditingController();

  _loginHandle() async {
    var username = usernameController.text;
    var password = passwordController.text;

    if (StringIsNullOrEmpty(username) || StringIsNullOrEmpty(password)) {
      CommonToast.showToast('用户名或密码不能为空！');
      return;
    }

    //9.发送请求
    const url = '/loginTest';
    var params = {
      'username': username,
      'password': password,
    };
    // ignore: avoid_print
    print('登录中');
    var res = await DioHttp.of(context).post(url, params);

    var resMap = json.decode(res.toString());
    int code = resMap['code'];
    String msg = resMap['msg'];
    print(msg);
    CommonToast.showToast(msg);

    if (code == 0) {
      //10.拿到token
      String token = resMap['data']['token'];
      //11.token存入本地缓存
      Store store = await Store.getInstance();
      await store.setString(StoreKeys.token, token);
      //12.全局共享 登入的token
      ScopedModelHelper.getModel<AuthModel>(context).login(token, context);

      Timer(const Duration(seconds: 1), () {
        Navigator.of(context).pop(); //回到上一个页面
      });
    }
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
        title: const Text('登录'),
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
                hintText: '请输入手机号',
              ),
              maxLength: 11,
            ),
            //2.密码
            TextField(
              controller: passwordController,
              obscureText: !showPassword, //开启密码框
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.code_outlined),
                labelText: '密码',
                hintText: '请输入密码',
                suffixIcon: IconButton(
                  icon: Icon(
                      showPassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      //8.更新状态
                      showPassword = !showPassword;
                    });
                  },
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(20)),
            //3.点击登录
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    // _login();
                    _loginHandle();
                  },
                  child: const Text('点击登录')),
            ),
            //4.去注册
            Row(
              mainAxisAlignment: MainAxisAlignment.center, //居中
              children: [
                const Text('还没有账号，'),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.register);
                    },
                    child: const Text('去注册~'))
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore: unused_element
void _login() {
  // ignore: avoid_print
  print("登录中...");
}
