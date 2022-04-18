import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:niceroom/routes.dart';
import 'package:niceroom/scoped_model/auth.dart';
import 'package:scoped_model/scoped_model.dart';

//1.添加无状态组件
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //2.加入MaterialApp
    /*当前版本建议使用const*/
    // return const MaterialApp(
    //   //3.引入自定义的页面
    //   home: LoginPage(),
    // );

    //4.加入fluro
    FluroRouter router = FluroRouter();

    //5.配置路由
    Routes.configureRoutes(router);

    //9.使用ScopedModel全局状态
    return ScopedModel<AuthModel>(
        model: AuthModel(),
        child: MaterialApp(
          //7.主题色
          // theme: ThemeData(primaryColor: const Color.fromARGB(255, 92, 153, 90)),//无效
          theme: ThemeData(primarySwatch: Colors.indigo),
          //6.在MaterialApp只用router
          onGenerateRoute: router.generator,

          //8.关闭debugShow
          debugShowCheckedModeBanner: false,

          //9.加载启动页
          initialRoute: Routes.loading,
        ));
  }
}
