import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/sticky_header/gf_sticky_header_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_1/models/test.dart';
import 'package:template_1/services/request.dart';

import '../animate_list/models/index.dart';

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

class _listDetailState extends ConsumerState<listDetail>
    with TickerProviderStateMixin {
  late Map map;
  List list = [];
  late TabController _tabController;
  late ScrollController _scrollController;
  late PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    /// 页面渲染完成后回调
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _detail();
    // });
    super.initState();
    _tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        print("咩");
        print(_tabController.index);
      });
    _scrollController = ScrollController();
    _pageController = PageController(
      initialPage: 4,
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print("更新！");
    // _detail();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(detailNotifierProvider);
    print("mie");
    print(result);
    // final todo = ModalRoute.of(context)!.settings.arguments as Map;
    // print(todo['name']);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green[100],
          // title: Row(children: [
          //   CircleAvatar(
          //     backgroundColor: Colors.red,
          //     backgroundImage: NetworkImage(result.avatar!),
          //     // backgroundColor: Colors.brown.shade800,
          //     // child: Text(result.username!),
          //   ),
          //   Text(result.username!)
          // ]),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            controller: _scrollController,
            children: [
              Row(children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    backgroundImage: NetworkImage(result.avatar!),
                    // backgroundColor: Colors.brown.shade800,
                    // child: Text(result.username!),
                  ),
                ),
                const SizedBox(
                  width: 10,
                  height: 10,
                ),
                Text(
                  result.username!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ]),

              Text(
                result.summary!,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
                height: 10,
              ),
              Text(
                result.context!,
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(
                width: 10,
                height: 10,
              ),
              ...result.imgArr!.map((e) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 3),
                  child: Image.network(e),
                );
              }),

              RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(children: [
                    const TextSpan(
                        text: "发布于：", style: TextStyle(color: Colors.black)),
                    TextSpan(
                      text: result.date!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ])),
              const Divider(
                // height: 10,
                thickness: 10,
              ),

              TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Text(
                        "评论",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "赞",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "转发",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "收藏",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    )
                  ]),
              // ConstrainedBox(
              //   constraints: BoxConstraints(
              //       maxHeight: MediaQuery.of(context).size.height),
              //   child: NestedScrollView(
              //     headerSliverBuilder:
              //         (BuildContext context, bool innerBoxIsScrolled) {
              //       return <Widget>[
              //         SliverOverlapAbsorber(
              //           handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
              //               context),
              //           sliver: SliverAppBar(
              //             // This is the title in the app bar.
              //             pinned: true,
              //             forceElevated: innerBoxIsScrolled,
              //             bottom: TabBar(
              //               controller: _tabController,
              //               // These are the widgets to put in each tab in the tab bar.
              //               tabs: [
              //                 Tab(
              //                   child: Text(
              //                     "评论",
              //                     style: TextStyle(
              //                         color: Colors.black, fontSize: 15),
              //                   ),
              //                 ),
              //                 Tab(
              //                   child: Text(
              //                     "赞",
              //                     style: TextStyle(
              //                         color: Colors.black, fontSize: 15),
              //                   ),
              //                 ),
              //                 Tab(
              //                   child: Text(
              //                     "转发",
              //                     style: TextStyle(
              //                         color: Colors.black, fontSize: 15),
              //                   ),
              //                 ),
              //                 Tab(
              //                   child: Text(
              //                     "收藏",
              //                     style: TextStyle(
              //                         color: Colors.black, fontSize: 15),
              //                   ),
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              //       ];
              //     },
              //     body: TabBarView(controller: _tabController, children: [
              //       ListView.builder(
              //         // controller: _scrollController,
              //         physics: const NeverScrollableScrollPhysics(),
              //         itemCount: 50,
              //         itemBuilder: (BuildContext context, int index) {
              //           return Container(child: Center(child: Text("page1")));
              //         },
              //       ),
              //       // Container(child: Center(child: Text("page1"))),
              //       Container(child: Text("page2")),
              //       Container(child: Text("page3")),
              //       Container(child: Text("page4")),
              //     ]),
              //   ),
              // ),
              Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: TabBarView(controller: _tabController, children: [
                  ListView.builder(
                    // controller: _scrollController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 50,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(child: Center(child: Text("page1")));
                    },
                  ),
                  // Container(child: Center(child: Text("page1"))),
                  Container(child: Text("暂无数据", textAlign: TextAlign.center)),
                  Container(child: Text("page3")),
                  Container(child: Text("page4")),
                ]),
              ),
              // Text(result.saying)
              BottomSheet(
                onClosing: () {},
                builder: (context) {
                  return Text("data");
                },
              )
            ],
          ),
        )
        // Center(
        //   child: ElevatedButton(
        //     onPressed: () {
        //       // Close the screen and return "Yep!" as the result.
        //       Navigator.pop(context, 'return');
        //       // context.pop();
        //     },
        //     child: list.length > 0
        //         ? ListView.builder(
        //             itemCount: list.length,
        //             itemBuilder: (BuildContext context, int index) {
        //               return Image(
        //                   image: NetworkImage('http://dummyimage.com/400x400'));
        //             },
        //           )
        //         : Image.asset(
        //             "assets/images/top.png",
        //             fit: BoxFit.cover,
        //             alignment: Alignment.topCenter,
        //             width: 100,
        //             height: 100,
        //           ),
        //     //     ListTile(
        //     //   title: Text("$value"),
        //     //   subtitle: Text(todo['age']),
        //     // ),
        //   ),
        // ),
        );
  }
}
