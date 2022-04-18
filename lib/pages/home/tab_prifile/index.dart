import 'package:flutter/material.dart';
import 'package:niceroom/pages/home/info/index.dart';
import 'package:niceroom/pages/home/tab_prifile/function_button.dart';
import 'package:niceroom/pages/home/tab_prifile/header.dart';

import 'advertisement.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('setting');
            },
            icon: const Icon(Icons.settings),
          ),
        ],
        title: const Text(
          '',
        ),
        elevation: 0.0, //去掉底部的阴影
      ),
      body: ListView(
        children: const [
          TabProfileHeader(),
          FunctionButton(),
          Padding(padding: EdgeInsets.all(10)),
          Advertisement(),
          // Info(
          //   showTitle: true,
          // ),
        ],
      ),
    );
  }
}
