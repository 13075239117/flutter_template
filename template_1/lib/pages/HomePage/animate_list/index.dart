import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:template_1/components/Comment/index.dart';
import 'package:template_1/pages/HomePage/customScrollView_joko/models/index.dart';
import 'package:template_1/pages/HomePage/customScrollView_joko/models/model.dart';
import 'package:template_1/pages/HomePage/listDetail_joko/index.dart';
import 'package:template_1/services/request.dart';
import 'package:template_1/untils/router.dart';

import 'models/index.dart';

class animate_list extends StatefulHookConsumerWidget {
  late int index;
  // late Animation<double> animation;
  late var listData;

  animate_list(
      {Key? key,
      required this.index,
      // required this.animation,
      required this.listData})
      : super(key: key);

  @override
  ConsumerState createState() => _animate_listState();
}

class _animate_listState extends ConsumerState<animate_list>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  // late Animation _animation;
  late CurvedAnimation _curvedAnimation;
  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();

    super.dispose();
  }

  void initState() {
    // TODO: implement initState

    //动画
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800))
          ..addListener(() {
            setState(() {});
          });
    // animation = ColorTween(begin: Colors.red, end: Colors.blue)
    //     .animate(_animationController)
    //   ..addListener(() {
    //     // setState(() {});
    //   });
    // _animationController.stop();

    _animationController.forward();
    _curvedAnimation = CurvedAnimation(
        parent: _animationController, curve: Curves.bounceInOut);
  }

  @override
  Widget build(BuildContext context) {
    // _animationController.forward();
    return ScaleTransition(
        scale: CurvedAnimation(
          parent: _animationController,
          curve: Curves.ease,
        ),
        // key: GlobalKey(),
        // opacity: _curvedAnimation,
        child: details(context: context, index: widget.index));
  }
}

class details extends StatefulHookConsumerWidget {
  const details({
    Key? key,
    required this.context,
    required this.index,
  }) : super(key: key);

  final BuildContext context;
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _detailsState();
}

class _detailsState extends ConsumerState<details> {
  late Dio dio;
  late Map map;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //   dio = DioRequest.getInstance().dio;
    //   // var res = await dio
    //   //     .get('http://127.0.0.1:4523/mock/965395/detail?userId=${widget.index}');
    //   // print(res);

    //   map = {
    //     "imgURL":
    //         'http://127.0.0.1:4523/mock/965395/detail?userId=${widget.index}'
    //   };
    //   ref.read(detailProvoder.notifier).state = map;
    // }

    // Future _detail() async {
    //   var res = await dio
    //       .get('http://127.0.0.1:4523/mock/965395/detail?userId=${widget.index}');
  }

  @override
  Widget build(BuildContext context) {
    List<ListStore> _listData = ref.watch(listStoreNotifierProvider);
    // Future.delayed(Duration(milliseconds: 100), () {
    //   // add/remove item
    // });
    // _animationController.forward();

    Future<void> push_joko(BuildContext context, page) async {
      // Navigator.push returns a Future that completes after calling
      // Navigator.pop on the Selection Screen.
      ref.read(detailNotifierProvider.notifier).getDetail(
          "http://127.0.0.1:4523/m1/965395-0-default/detail?userId=${_listData[widget.index].userId}");
      final result = await Navigator.push(
        context,
        // Create the SelectionScreen in the next step.
        MaterialPageRoute(
            builder: (context) => listDetail(),
            settings: RouteSettings(arguments: {'name': "ok", 'age': '24'})),
      );
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('$result')));
      print(mounted);
      print(result);
    }

    // print("渲染${widget.index}");
    final _listHeight = <int>[100, 200, 200, 300, 400, 200, 300, 400, 200, 100];
    return IntrinsicHeight(
        child: GestureDetector(
      onTap: () {
        // _scrollController.animateTo(0.00,
        //     duration: Duration(seconds: 2), curve: Curves.easeOutBack);
        // print(MediaQuery.of(context).size);
        // push_joko(context, listDetail);
        // Navigator.push(
        //   context,
        //   // Create the SelectionScreen in the next step.
        //   MaterialPageRoute(builder: (context) => listDetail()),
        // );
        // push_joko(context, listDetail);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${_listData[widget.index].saying} 第${widget.index}个",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      backgroundImage:
                          NetworkImage(_listData[widget.index].avatar),
                      // backgroundColor: Colors.brown.shade800,
                      child: Text(_listData[widget.index].username),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'fuck${widget.index}',
                        style: TextStyle(wordSpacing: 5),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Text('https://picsum.photos/300/300?random=${widget.index}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    )),
                Wrap(
                  children: [
                    ..._listData[widget.index]
                        .imgArr
                        .map((url) => Card(
                            clipBehavior: Clip.antiAlias,
                            // margin: EdgeInsets.all(0),
                            child: Image.network(
                              url,
                              errorBuilder: (context, error, stackTrace) {
                                print(stackTrace);
                                return Image.asset(
                                  "assets/images/top.png",
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                  width: 100,
                                  height: 100,
                                );
                              },
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              width: 100,
                              height: 100,
                            )))
                        .toList(),
                    // Card(
                    //     clipBehavior: Clip.antiAlias,
                    //     // margin: EdgeInsets.all(0),
                    //     child: Image.network(
                    //       errorBuilder: (context, error, stackTrace) {
                    //         return Image.asset(
                    //           "assets/images/top.png",
                    //           fit: BoxFit.cover,
                    //           alignment: Alignment.topCenter,
                    //           width: 100,
                    //           height: 100,
                    //         );
                    //       },
                    //       filterQuality: FilterQuality.high,
                    //       'https://picsum.photos/300/300?random=${widget.index}',
                    //       fit: BoxFit.cover,
                    //       alignment: Alignment.topCenter,
                    //       width: 100,
                    //       height: 100,
                    //     )),
                    // Card(
                    //     clipBehavior: Clip.antiAlias,
                    //     child: Image.network(
                    //       filterQuality: FilterQuality.high,
                    //       'https://picsum.photos/300/300?random=${widget.index + 1}',
                    //       fit: BoxFit.cover,
                    //       alignment: Alignment.topCenter,
                    //       width: 100,
                    //       height: 100,
                    //     )),
                    // Card(
                    //     clipBehavior: Clip.antiAlias,
                    //     child: Image.network(
                    //       filterQuality: FilterQuality.high,
                    //       'https://picsum.photos/300/300?random=${widget.index + 2}',
                    //       fit: BoxFit.cover,
                    //       alignment: Alignment.topCenter,
                    //       width: 100,
                    //       height: 100,
                    //     )),
                    // Card(
                    //     clipBehavior: Clip.antiAlias,
                    //     child: Image.network(
                    //       filterQuality: FilterQuality.high,
                    //       'https://picsum.photos/300/300?random=${widget.index + 3}',
                    //       fit: BoxFit.cover,
                    //       alignment: Alignment.topCenter,
                    //       width: 100,
                    //       height: 100,
                    //     ))
                  ],
                ),
                Icon(
                  Icons.sunny,
                  color: Colors.red,
                ),
                // Row(
                //   children: [
                //     CircleAvatar(
                //       backgroundColor: Colors.red,
                //       backgroundImage:
                //           NetworkImage(_listData[widget.index].avatar),
                //       // backgroundColor: Colors.brown.shade800,
                //       child: Text(_listData[widget.index].username,
                //           textAlign: TextAlign.center),
                //       radius: 15,
                //     ),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Text(
                //         "123123aswdassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss")
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        )),
                    IconButton(
                      onPressed: () {
                        // Scaffold.of(context).c
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 550,
                              width: double.maxFinite,
                              child: Commment(),
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.messenger_outline),
                    ),
                    IconButton(
                        onPressed: () {
                          Share.share(
                              'check out my website https://example.com');
                        },
                        icon: Icon(Icons.share)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
