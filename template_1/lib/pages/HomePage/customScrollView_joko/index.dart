import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_1/pages/HomePage/animate_list/index.dart';
import 'package:template_1/services/request.dart';

import 'models/index.dart';
import 'models/model.dart';

class customScrollView_joko extends StatefulHookConsumerWidget {
  BuildContext context;
  customScrollView_joko({Key? key, required this.context}) : super(key: key);

  @override
  _customScrollView_jokoState createState() => _customScrollView_jokoState();
}

class _customScrollView_jokoState extends ConsumerState<customScrollView_joko> {
  bool isshow = true;
  late ScrollController _controller;
  // late Dio dio;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // ref.read(listStoreNotifierProvider.notifier).getList(2);
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _controller = ScrollController()
      ..addListener(() {
        if (_controller.position.pixels ==
            _controller.position.maxScrollExtent) {
          // _getMoreData();
          print("已触底！");
          ref.read(listStoreNotifierProvider.notifier).getList(2);
          setState(() {
            isshow = !isshow;
            hideTip();
          });
        }
      });
    ref.read(listStoreNotifierProvider.notifier).getList(2);
  }

  hideTip() {
    Timer(Duration(seconds: 2), () {
      setState(() {
        isshow = !isshow;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ListStore> _listData = ref.watch(listStoreNotifierProvider);

    print("长度");
    print(_listData.length);
    print("重绘");
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(children: [
        CustomScrollView(
          controller: _controller,
          physics: const BouncingScrollPhysics(),
          slivers: [
            // appBar_joko(),
            // SliverList(
            //   delegate: SliverChildBuilderDelegate((context, index) {
            //     return ListTile(
            //       leading: Text("1"),
            //       title: Text("ok"),
            //     );r
            //   }, childCount: 20),
            // ),
            // SliverSafeArea(
            // sliver:
            // SliverPadding(
            //   padding: EdgeInsets.all(8),
            //   sliver:
            SliverOverlapInjector(
              // This is the flip side of the SliverOverlapAbsorber
              // above.
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  widget.context),
            ),
            SliverPadding(
              padding: EdgeInsets.all(4),
              sliver:
                  // SliverGrid(
                  //     delegate: SliverChildBuilderDelegate((context, index) {
                  //       return list_card(index);
                  //     }, childCount: 20),
                  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //       mainAxisExtent: 300,
                  //       // maxCrossAxisExtent: double.maxFinite,
                  //       //长宽比
                  //       childAspectRatio: 1.5,
                  //       //列间距
                  //       crossAxisSpacing: 5,
                  //       //行间距
                  //       mainAxisSpacing: 10,
                  //       crossAxisCount: 2,
                  //     )
                  //     // SliverGridDelegateWithFixedCrossAxisCount(
                  //     //     crossAxisCount: 2,
                  //     //     crossAxisSpacing: 8,
                  //     //     mainAxisSpacing: 8,
                  //     //     childAspectRatio: 2)
                  //     //     ),
                  //     ),
                  // SliverFillRemaining(
                  //     // hasScrollBody: false,
                  //     fillOverscroll: true,
                  //     child: LayoutBuilder(builder: (context, constraints) {
                  //       return ConstrainedBox(
                  //         constraints: BoxConstraints(
                  //           minHeight: constraints.maxHeight,
                  //         ),
                  //         child: MasonryGridView.builder(
                  //           key: _listkey,
                  //           controller: _scrollController,
                  //           // 展示几列
                  //           // crossAxisCount: 2,
                  //           // 元素总个数
                  //           itemCount: 50,
                  //           // 单个子元素
                  //           itemBuilder: (BuildContext context, int index) {
                  //             print('$height:$index');
                  //             return list_card(index);
                  //           },
                  //           // 纵向元素间距
                  //           mainAxisSpacing: 10,
                  //           // 横向元素间距
                  //           crossAxisSpacing: 10,
                  //           //本身不滚动，让外面的singlescrollview来滚动
                  //           physics: BouncingScrollPhysics(),
                  //           shrinkWrap: true,
                  //           gridDelegate:
                  //               SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  //                   crossAxisCount: 2), //收缩，让元素宽度自适应
                  //         ),
                  //       );
                  //     })
                  //     // CustomMultiChildLayout(
                  //     //   delegate: ProxyClass(items.length, 3, 5),
                  //     //   children: items,
                  //     // ),
                  //     ),

                  SliverList(
                // key: _listKey,
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    // double height = (Random().nextInt(4) + 1) * 100;
                    // print('$index');
                    return animate_list(
                        index: index,
                        // animation: animation,
                        listData: _listData[index]);
                  },
                  childCount: _listData.length,
                ),
              ),
              // ListView.builder(
              //   itemCount: 1,
              //   itemBuilder: (BuildContext context, int index) {
              //     return ;
              //   },
              // ),
              // _listData.isEmpty
              //     ? SliverToBoxAdapter()
              //     : SliverAnimatedList(
              //         // key: _listKey,
              //         initialItemCount: _listData.length,
              //         itemBuilder:
              //             (context, index, Animation<double> animation) {
              //           print('第$index个');
              //           // _animationController.forward();

              //           return _listData.isEmpty
              //               ? Center(
              //                   child: Text("咩"),
              //                 )
              //               : animate_list(
              //                   index: index,
              //                   animation: animation,
              //                   listData: _listData[index]);
              //           // FadeTransition(
              //           //     key: GlobalKey(),
              //           //     opacity: _curvedAnimation,
              //           //     child: list_card(index)
              //           //     );
              //         },
              //       ),
              //     SliverFillRemaining(
              //   fillOverscroll: true,
              //   child: MasonryGridView.count(
              //     // physics: const BouncingScrollPhysics(),
              //     crossAxisCount: 2,
              //     mainAxisSpacing: 4,
              //     crossAxisSpacing: 4,
              //     itemBuilder: (context, index) {
              //       final height = (Random().nextInt(4) + 1) * 100;
              //       print(height);
              //       return Image.network(
              //         'https://picsum.photos/100/$height?random=$index',
              //         width: 100.toDouble(),
              //         height: height.toDouble(),
              //         fit: BoxFit.cover,
              //       );
              //     },
              //     itemCount: 50,
              //   ),
              // )
              //     SliverFillRemaining(
              //   fillOverscroll: true,
              //   child: GridView.builder(
              //     shrinkWrap: true,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       // mainAxisExtent: (Random().nextInt(4) + 1) * 100,
              //       // ((Random().nextDouble() * 3) + 7) * 30
              //       // maxCrossAxisExtent: double.maxFinite,
              //       //长宽比
              //       // childAspectRatio: (Random().nextDouble() * 5) + 1,
              //       //列间距
              //       crossAxisSpacing: 5,
              //       //行间距
              //       mainAxisSpacing: 10,
              //       crossAxisCount: 2,
              //     ),
              //     itemBuilder: (context, index) {
              //       return list_card(index);
              //     },
              //   ),
              // ),
              //     SliverGrid(
              //   delegate: SliverChildBuilderDelegate((context, index) {
              //     double height = (Random().nextInt(4) + 1) * 100;
              //     print((Random().nextDouble() * 5) + 1);
              //     return list_card(index);
              //   }, childCount: 10),
              //   gridDelegate: SliverWovenGridDelegate.count(
              //     crossAxisCount: 2,
              //     mainAxisSpacing: 8,
              //     crossAxisSpacing: 8,
              //     pattern: [
              //       WovenGridTile(
              //         1,
              //         crossAxisRatio: 1,
              //         alignment: AlignmentDirectional.center,
              //       ),
              //       WovenGridTile(
              //         5 / 7,
              //         crossAxisRatio: 0.9,
              //         alignment: AlignmentDirectional.center,
              //       ),
              //     ],
              //   ),
              //   //     SliverGridDelegateWithFixedCrossAxisCount(
              //   //   // mainAxisExtent: (Random().nextInt(4) + 1) * 100,
              //   //   // ((Random().nextDouble() * 3) + 7) * 30
              //   //   // maxCrossAxisExtent: double.maxFinite,
              //   //   //长宽比
              //   //   childAspectRatio: (Random().nextDouble() * 5) + 1,
              //   //   //列间距
              //   //   crossAxisSpacing: 5,
              //   //   //行间距
              //   //   mainAxisSpacing: 10,
              //   //   crossAxisCount: 2,
              //   // )
              //   // SliverGridDelegateWithFixedCrossAxisCount(
              //   //     crossAxisCount: 2,
              //   //     crossAxisSpacing: 8,
              //   //     mainAxisSpacing: 8,
              //   //     childAspectRatio: 2)
              //   //     ),
              // ),
            ),
            // SliverToBoxAdapter(
            //     child: ConstrainedBox(
            //         constraints: BoxConstraints(
            //             maxHeight: MediaQuery.of(context).size.height),
            //         child: Stack(
            //             alignment: Alignment.topCenter,
            //             children: [Positioned(bottom: 200, child: Text('data'))])))
            // ),
            // ),
          ],
        ),
        // Positioned(top: 200, child: Text('data')),
        // Tooltip(
        //   showDuration: Duration(seconds: 2),
        //   message: "咩",
        //   child: Center(
        //     child: Container(
        //         width: 100,
        //         height: 100,
        //         decoration: BoxDecoration(
        //             color: Color.fromARGB(255, 105, 231, 153),
        //             borderRadius: BorderRadius.circular(10)
        //             // border: Border.all(),
        //             ),
        //         child:
        //             Center(child: Text('咩 等下啊1', textAlign: TextAlign.center))),
        //   ),
        // )
        Offstage(
          offstage: isshow,
          child: Center(
            child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 105, 231, 153),
                    borderRadius: BorderRadius.circular(10)
                    // border: Border.all(),
                    ),
                child:
                    Center(child: Text('咩 等下啊', textAlign: TextAlign.center))),
          ),
        )
      ]),
    );
  }
}
