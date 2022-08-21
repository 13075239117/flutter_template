// import 'dart:ffi';
import 'dart:ui';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:getwidget/getwidget.dart';
import 'package:template_1/pages/HomePage/index.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "template_1",
      home: MyHomePage_joko(),
      theme: ThemeData(
          cardTheme: CardTheme(
            elevation: 5,
          ),
          appBarTheme: AppBarTheme(
              backgroundColor: Color(0x33FB8C00),
              elevation: 0, //隐藏AppBar底部的阴影分割线
              centerTitle: true,
              systemOverlayStyle: SystemUiOverlayStyle.dark //设置状态栏的背景
              ),
          scaffoldBackgroundColor: Colors.grey[200],
          primaryColor: Colors.red,
          visualDensity: VisualDensity.standard),
    );
  }
}
