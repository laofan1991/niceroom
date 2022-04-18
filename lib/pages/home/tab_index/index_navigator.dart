import 'package:flutter/material.dart';
import 'package:niceroom/pages/home/tab_index/index_navigator_item.dart';

class IndexNavigator extends StatelessWidget {
  const IndexNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //引入Navigator数据，
        children: indexNavigatorItemList
            .map((item) => InkWell(
                  //InkWell？？
                  onTap: () {
                    item.onTap!(context);
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        item.imageUri,
                        width: 47.5,
                      ),
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
