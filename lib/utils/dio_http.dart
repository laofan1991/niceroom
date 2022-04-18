import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:niceroom/config.dart';
import 'package:niceroom/routes.dart';
import 'package:niceroom/scoped_model/auth.dart';
import 'package:niceroom/utils/common_toast.dart';
import 'package:niceroom/utils/scoped_model_helper.dart';

//http://zdemo.test.com

class DioHttp {
  late Dio _client;
  dynamic context;

  static DioHttp of(BuildContext context) {
    return DioHttp._internal(context);
  }

  DioHttp._internal(BuildContext context) {
    //没有 才重新生成http请求
    if (context != this.context) {
      var options = BaseOptions(
        baseUrl: Config.BaseUrl,
        connectTimeout: 1000 * 10,
        receiveTimeout: 1000 * 3,
        extra: {'context': context},
      );
      //拦截器,处理登录是否过期
      Interceptor interceptor = InterceptorsWrapper(
        //Interceptors包装器
        //这里的用法，有待深入：response,handler
        onResponse: (response, handler) {
          //接收的响应
          print(response);

          var error = json.decode(response.toString())['error'];
          print(error);
          if (error != null) {
            ScopedModelHelper.getModel<AuthModel>(context).logout();
            //loading页不用登录，其他页面则登录
            if (ModalRoute.of(context)?.settings.name != Routes.loading) {
              CommonToast.showToast('登录过期');
              Navigator.of(context).pushNamed(Routes.login);
            }
          }
          print('通过拦截器，进入下一步');

          handler.next(response); //这里的用法，有待深入

          // if (status == 404) {
          //   CommonToast.showToast('接口地址错误，当前接口:${res.requestOptions.path}');
          // }
          // 其他4开头的，则清除token
          // if (status.toString().startsWith('4')) {
          //   ScopedModelHelper.getModel<AuthModel>(context).logout();
          //   //loading页不同登录
          //   if (ModalRoute.of(context)?.settings.name == Routes.loading) {}
          //   CommonToast.showToast('登录过期');
          //   Navigator.of(context).pushNamed(Routes.login);
          // }
          // return res;
        },
      );

      var client = Dio(options);
      client.interceptors.add(interceptor); //拦截器使用
      _client = client;

      this.context = context;
    }
  }

  //get方法，返回Future
  Future<Response<Map<String, dynamic>>> get(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return await _client.get(path, queryParameters: params, options: options);
  }

  //post方法，返回Future
  Future<Response<Map<String, dynamic>>> post(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return await _client.post(path, data: params, options: options);
  }

  //postFormData方法，返回Future
  Future<Response<Map<String, dynamic>>> postFormData(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(
        //contentType: ContentType.parse('multipart/form-data'), //这种报错
        contentType: 'multipart/form-data',
        headers: {'Authorization': token});
    return await _client.post(path, data: params, options: options);
  }
}
