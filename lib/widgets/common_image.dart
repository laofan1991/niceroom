// import 'package:flutter/material.dart';
// // ignore: import_of_legacy_library_into_null_safe
// import 'package:flutter_advanced_networkimage/provider.dart';

// final networkUriReg = RegExp('^http');
// final localUriReg = RegExp('^static');

// class CommonImage extends StatelessWidget {
//   final String src;
//   final double? width;
//   final double? height;
//   final BoxFit? fit;

//   const CommonImage(
//       {Key? key, required this.src, this.width, this.height, this.fit})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     if (networkUriReg.hasMatch(src)) {
//       return Image(
//           width: width,
//           height: height,
//           fit: fit,
//           image: AdvancedNetworkImage(
//             src,
//             useDiskCache: true, //是否缓存
//             cacheRule: const CacheRule(maxAge: Duration(days: 7)), //缓存7天
//             timeoutDuration: const Duration(seconds: 10), //超时时间10s
//           ));
//     }
//     if (localUriReg.hasMatch(src)) {
//       return Image.asset(
//         src,
//         width: width,
//         height: height,
//         fit: fit,
//       );
//     }

//     assert(false, '图片地址 src 不合法！'); //提示
//     return Container();
//   }
// }
