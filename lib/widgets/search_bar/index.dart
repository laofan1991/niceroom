import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final bool? shwoLocation;
  final Function? goBackCallback;
  final String? inputValue;
  final String? defaultInputValue;
  final Function? onCancel;
  final bool? showMap;
  final bool? onSearch;
  final ValueChanged<String>? onSearchSubmit;

  const SearchBar(
      {Key? key,
      this.shwoLocation,
      this.goBackCallback,
      this.inputValue = '',
      this.defaultInputValue = '请输入关键词',
      this.onCancel,
      this.showMap,
      this.onSearch,
      this.onSearchSubmit})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _searchWord = '';
  late TextEditingController _controller;
  // late FocusNode _focus; //搜索框跳到搜索页后，返回上一页去焦点
  Function? _onClean() {
    _controller.clear();
    setState(() {
      _searchWord = '';
    });
    return null;
  }

  @override
  void initState() {
    // _focus = FocusNode();
    _controller = TextEditingController(text: widget.inputValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //有状态组件中拿参数，应从widget对象中拿
        if (widget.shwoLocation != null)
          //用户手势检测
          GestureDetector(
            onTap: () {},
            child: Row(
              children: const [
                Icon(Icons.room, color: Colors.green, size: 20),
                Text('广州',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18)),
              ],
            ),
          ),
        if (widget.goBackCallback != null)
          //用户手势检测
          GestureDetector(
            // onTap: widget.goBackCallback,
            child: const Icon(
              Icons.chevron_left,
              color: Colors.black87,
            ),
          ),
        const Padding(padding: EdgeInsets.only(right: 10)),
        //弹性
        Expanded(
          child: Container(
            height: 30,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(18)),
            padding: const EdgeInsets.only(left: 2),
            child: TextField(
              // focusNode: _focus,
              onTap: () {
                if (widget.onSearchSubmit == null) {
                  // _focus.unfocus();
                }

                if (widget.onSearch != null) {
                  Navigator.of(context).pushNamed('search');
                }
              },

              onSubmitted: widget.onSearchSubmit,

              textInputAction: TextInputAction.search, //键盘搜索键配置
              controller: _controller,
              style: const TextStyle(fontSize: 14),
              onChanged: (String value) {
                setState(() {
                  _searchWord = value;
                });
              },
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: -4),
                hintText: '请输入搜索词',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                border: InputBorder.none,
                //前置图标
                prefixIcon: const Icon(
                  Icons.search,
                  size: 24,
                  color: Colors.grey,
                ),
                //后置图标
                suffixIcon: GestureDetector(
                  onTap: () {
                    _onClean();
                  },
                  child: const Icon(
                    Icons.clear,
                    size: 24,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 4),
        if (widget.onCancel != null)
          GestureDetector(
            // onTap: widget.goBackCallback,
            child: const Text(
              '取消',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        const Padding(padding: EdgeInsets.only(right: 10)),
        if (widget.showMap != null)
          //用户手势检测
          GestureDetector(
            onTap: () {},
            child: Row(
              children: const [
                Icon(Icons.map_outlined, color: Colors.white, size: 25),
                // Image.asset(
                //   'static/icons/widget_search_bar_map.png',
                //   width: 60,
                // ),
              ],
            ),
          ),
      ],
    );
  }
}
