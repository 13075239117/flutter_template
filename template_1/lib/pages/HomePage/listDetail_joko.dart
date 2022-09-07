import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_1/models/test.dart';
import 'package:template_1/services/request.dart';

import 'animate_list/models/index.dart';

class Todo {
  final String name;
  final String age;

  Todo(this.name, this.age);
}

class listDetail extends StatefulHookConsumerWidget {
  listDetail({Key? key}) : super(key: key);

  @override
  _listDetailState createState() => _listDetailState();
}

class _listDetailState extends ConsumerState<listDetail> {
  late Map map;
  List list = [];
  @override
  void initState() {
    // TODO: implement initState
    /// 页面渲染完成后回调
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _detail();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print("更新！");
    // _detail();
    super.didChangeDependencies();
  }

  Future _detail() async {
    late Dio dio = DioRequest.getInstance().dio;
    final photo = ref.watch(detailProvoder);
    var res = await dio.get(photo['imgURL']);
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    final value = ref.watch(helloWorldProvider);
    final photo = ref.watch(testProvoder);
    print(photo);
    // print(photo.value?.data);
    if (photo.value?.data != null) {
      map = photo.value?.data as Map;
      list = map['imgArr'];
    }

    print(list);
    final todo = ModalRoute.of(context)!.settings.arguments as Map;
    // print(todo['name']);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Close the screen and return "Yep!" as the result.
            Navigator.pop(context, 'return');
            // context.pop();
          },
          child: list.length > 0
              ? ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image(
                        image: NetworkImage('http://dummyimage.com/400x400'));
                  },
                )
              : Image.asset(
                  "assets/images/top.png",
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  width: 100,
                  height: 100,
                ),
          //     ListTile(
          //   title: Text("$value"),
          //   subtitle: Text(todo['age']),
          // ),
        ),
      ),
    );
  }
}
