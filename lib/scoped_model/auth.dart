import 'package:flutter/material.dart';
import 'package:niceroom/utils/store.dart';
import 'package:scoped_model/scoped_model.dart';

class AuthModel extends Model {
  late String _token = '';
  String get token => _token;

  // ignore: unnecessary_type_check
  bool get isLogin => _token is String && _token != '';

  void initApp(BuildContext context) async {
    Store store = await Store.getInstance();
    dynamic token_ = await store.getString(StoreKeys.token);
    String token = token_.toString();

    if (token != '' && token != 'null') {
      login(token, context);
      print(token);
      print('...login');
    }
  }

  void login(String token, BuildContext context) {
    _token = token;
    notifyListeners(); //通知其他组件
  }

  void logout() async {
    _token = '';
    notifyListeners();
    Store store = await Store.getInstance();
    await store.setString(StoreKeys.token, ''); //清空store
  }
}
