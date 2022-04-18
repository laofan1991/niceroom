import 'package:flutter/material.dart';
import 'package:niceroom/scoped_model/auth.dart';
import 'package:niceroom/utils/scoped_model_helper.dart';

var textStyle = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

class TabProfileHeader extends StatelessWidget {
  const TabProfileHeader({Key? key}) : super(key: key);

  Widget _notLoginBuilder(BuildContext context) {
    return Container(
      color: Colors.indigo,
      padding: const EdgeInsets.all(16),
      height: 110,
      child: Row(
        children: [
          const SizedBox(
            height: 100,
            width: 100,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://tva1.sinaimg.cn/large/008i3skNgy1gsuh24kjbnj30do0duaad.jpg'),
            ),
          ),
          const SizedBox(width: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('login');
                    },
                    child: Text('登录', style: textStyle),
                  ),
                  Text('  /  ', style: textStyle),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('register');
                    },
                    child: Text('注册', style: textStyle),
                  ),
                ],
              ),
              const Text(
                '登录后可以体验更多',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _loginBuilder(BuildContext context) {
    String userImage =
        'https://pic3.zhimg.com/80/v2-9bbddf8c625d251d9a9e608238425d62_720w.jpg';
    return Container(
      color: Colors.indigo,
      padding: const EdgeInsets.all(16),
      height: 110,
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ),
          ),
          const SizedBox(width: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '刘德华',
                    style: textStyle,
                  ),
                ],
              ),
              const Text(
                '查看编辑个人资料',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // var isLogin = false;
    var isLogin = ScopedModelHelper.getModel<AuthModel>(context).isLogin;

    if (isLogin == false) {
      return _notLoginBuilder(context);
    } else {
      return _loginBuilder(context);
    }
  }
}
