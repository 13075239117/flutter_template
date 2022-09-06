import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_1/pages/HomePage/listDetail_joko.dart';
import 'package:template_1/services/request.dart';
import 'package:template_1/untils/router.dart';

import 'models/index.dart';

class animate_list extends StatefulWidget {
  late int index;
  late Animation<double> animation;

  animate_list({Key? key, required this.index, required this.animation})
      : super(key: key);

  @override
  State<animate_list> createState() => _animate_listState();
}

class _animate_listState extends State<animate_list>
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
    _animationController.stop();

    // _animationController.forward();
    _curvedAnimation = CurvedAnimation(
        parent: _animationController, curve: Curves.bounceInOut);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
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
    dio = DioRequest.getInstance().dio;
    // var res = await dio
    //     .get('http://127.0.0.1:4523/mock/965395/detail?userId=${widget.index}');
    // print(res);
    map = ref.read(detailProvoder);
    map = {
      'http://127.0.0.1:4523/mock/965395/detail?userId=${widget.index}':
          widget.index.toString()
    };
  }

  Future _detail() async {
    var res = await dio
        .get('http://127.0.0.1:4523/mock/965395/detail?userId=${widget.index}');
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(milliseconds: 100), () {
    //   // add/remove item
    // });
    // _animationController.forward();

    print("渲染${widget.index}");
    final _listHeight = <int>[100, 200, 200, 300, 400, 200, 300, 400, 200, 100];
    return IntrinsicHeight(
        child: GestureDetector(
      onTap: () {
        // _scrollController.animateTo(0.00,
        //     duration: Duration(seconds: 2), curve: Curves.easeOutBack);
        print(MediaQuery.of(context).size);
        // push_joko(context, listDetail);
        // Navigator.push(
        //   context,
        //   // Create the SelectionScreen in the next step.
        //   MaterialPageRoute(builder: (context) => listDetail()),
        // );
        push_joko(context, listDetail);
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
                widget.index % 2 == 0
                    ? Text(
                        " A given user's initials should always be paired with the same background color, for consistencytext${widget.index}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    : Text(
                        " ${widget.index}",
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
                      backgroundImage: NetworkImage(
                          'https://picsum.photos/300/300?random=${widget.index}'),
                      // backgroundColor: Colors.brown.shade800,
                      // child: const Text('AH'),s
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
                    Card(
                        clipBehavior: Clip.antiAlias,
                        // margin: EdgeInsets.all(0),
                        child: Image.network(
                          filterQuality: FilterQuality.high,
                          'https://picsum.photos/300/300?random=${widget.index}',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          width: 100,
                          height: 100,
                        )),
                    Card(
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          filterQuality: FilterQuality.high,
                          'https://picsum.photos/300/300?random=${widget.index + 1}',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          width: 100,
                          height: 100,
                        )),
                    Card(
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          filterQuality: FilterQuality.high,
                          'https://picsum.photos/300/300?random=${widget.index + 2}',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          width: 100,
                          height: 100,
                        )),
                    Card(
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          filterQuality: FilterQuality.high,
                          'https://picsum.photos/300/300?random=${widget.index + 3}',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          width: 100,
                          height: 100,
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        )),
                    Icon(Icons.messenger_outline),
                    IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Future<void> push_joko(BuildContext context, page) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
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
}
