import 'package:fluttertoast/fluttertoast.dart';

class CommonToast {
  //静态方法
  static showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.CENTER, //居中显示
    );
  }
}
