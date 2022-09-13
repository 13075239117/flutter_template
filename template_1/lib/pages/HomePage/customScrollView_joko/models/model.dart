import 'package:flutter/material.dart';

@immutable
class ListStore {
  final String username;
  final List<dynamic> imgArr;
  final String avatar;
  final String saying;
  const ListStore(
      {required this.username,
      required this.imgArr,
      required this.avatar,
      required this.saying});
  ListStore copywith(String? username, List<dynamic>? imgArr, String? avatar,
      String? saying, String? userAvatar) {
    return ListStore(
      username: username!,
      imgArr: imgArr!,
      avatar: avatar!,
      saying: saying!,
    );
  }
}
