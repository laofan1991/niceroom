import 'package:flutter/material.dart';
import 'package:niceroom/scoped_model/auth.dart';
import 'package:niceroom/utils/scoped_model_helper.dart';

//准备数据
//三个属性：title,imag,onTap
class IndexNavigatorItem {
  final String title;
  final String imageUri;
  final Function(BuildContext contenxt)? onTap;
  //构造函数，三个属性都需要
  IndexNavigatorItem(this.title, this.imageUri, this.onTap);
}

List<IndexNavigatorItem> indexNavigatorItemList = [
  IndexNavigatorItem('整租', 'static/images/home_index_navigator_total.png',
      (BuildContext context) {
    var isLogin = ScopedModelHelper.getModel<AuthModel>(context).isLogin;
    if (isLogin == false) {
      Navigator.of(context).pushNamed('login');
    }
  }),
  IndexNavigatorItem('合租', 'static/images/home_index_navigator_share.png',
      (BuildContext context) {
    var isLogin = ScopedModelHelper.getModel<AuthModel>(context).isLogin;
    if (isLogin == false) {
      Navigator.of(context).pushNamed('login');
    }
  }),
  IndexNavigatorItem('地图找房', 'static/images/home_index_navigator_map.png',
      (BuildContext context) {
    var isLogin = ScopedModelHelper.getModel<AuthModel>(context).isLogin;
    if (isLogin == false) {
      Navigator.of(context).pushNamed('login');
    }
  }),
  IndexNavigatorItem('去出租', 'static/images/home_index_navigator_rent.png',
      (BuildContext context) {
    var isLogin = ScopedModelHelper.getModel<AuthModel>(context).isLogin;
    if (isLogin == false) {
      Navigator.of(context).pushNamed('login');
    }
  }),
];
