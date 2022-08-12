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
import 'package:shimmer/shimmer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "template_1",
      home: MyHomePage(),
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
          visualDensity: VisualDensity.standard),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int selected = 0;
  late AnimationController am;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //     AnimationController(vsync: this, duration: Duration(seconds: 5))
  //       ..addListener(() {
  //         setState(() => {angel = am.value * pi * 2, print(angel)});
  //       })
  //       ..repeat();
  double angel = 0;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // am = AnimationController(vsync: this, duration: Duration(seconds: 5))
  //   //   ..addListener(() {
  //   //     setState(() {
  //   //       angel = am.value * pi * 2;
  //   //       print(angel);
  //   //     });
  //   //   })
  //   //   ..repeat(reverse: true);
  // }
  late TabController tabController;
  late ScrollController _primaryScrollController = ScrollController();
  @override
  void initState() {
    // _primaryScrollController = ScrollController();
    super.initState();
    // if (_primaryScrollController.position.pixels > 300) {
    //   _primaryScrollController.animateTo(
    //     0.00,
    //     duration: const Duration(milliseconds: 4000),
    //     curve: Curves.easeOutBack, // TODO(ianh): Use a more appropriate curve.
    //   );
    // }
    tabController = TabController(length: 3, vsync: this);
    // _primaryScrollController.addListener(() {
    //   print(_primaryScrollController.position.pixels);
    //   // if (_primaryScrollController.position.pixels > 300) {
    //   //   _primaryScrollController.animateTo(
    //   //     0.00,
    //   //     duration: const Duration(milliseconds: 4000),
    //   //     curve:
    //   //         Curves.easeOutBack, // TODO(ianh): Use a more appropriate curve.
    //   //   );
    //   // }
    // });
  }

  @override
  void dispose() {
    tabController.dispose();
    _primaryScrollController.dispose();
    super.dispose();
  }

  void _handleStatusBarTap() {
    // print(_primaryScrollController.hasClients);
    if (_primaryScrollController.hasClients) {
      print('animatetOP');
      _primaryScrollController.animateTo(
        0.00,
        duration: const Duration(milliseconds: 2000),
        curve: Curves.easeOutBack, // TODO(ianh): Use a more appropriate curve.
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   bottom: TabBar(controller: tabController, tabs: [
      //     Tab(
      //       icon: Icon(Icons.cloud_outlined),
      //     ),
      //     Tab(
      //       icon: Icon(Icons.beach_access_sharp),
      //     ),
      //     Tab(
      //       icon: Icon(Icons.brightness_5_sharp),
      //     ),
      //   ]),
      // ),
      // appBar: AppBar(
      //     leading: Builder(
      //       builder: (BuildContext context) {
      //         return IconButton(
      //           icon: Icon(Icons.abc),
      //           onPressed: () {
      //             _scaffoldKey.currentState!.openDrawer();
      //             // Scaffold.of(context).showBottomSheet<void>(
      //             //   (BuildContext context) {
      //             //     return Container(
      //             //       alignment: Alignment.center,
      //             //       height: 200,
      //             //       color: Colors.amber,
      //             //       child: Center(
      //             //         child: Column(
      //             //           mainAxisSize: MainAxisSize.min,
      //             //           children: <Widget>[
      //             //             const Text('BottomSheet'),
      //             //             ElevatedButton(
      //             //               child: const Text('Close BottomSheet'),
      //             //               onPressed: () {
      //             //                 Navigator.pop(context);
      //             //               },
      //             //             )
      //             //           ],
      //             //         ),
      //             //       ),
      //             //     );
      //             //   },
      //             // );
      //           },
      //         );
      //       },
      //     ),
      //     title: Text(
      //       "template",
      //     ),
      //     centerTitle: true),
      body: mainPage(
        ki: _scaffoldKey,
        con: _primaryScrollController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          setState(() {
            _handleStatusBarTap();
          });
        }),
        child: const Icon(Icons.navigation),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex: selected,
        onTap: ((index) {
          setState(() {
            selected = index;
          });
        }),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
      ),
      drawer: GFDrawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GFDrawerHeader(
              currentAccountPicture: GFAvatar(
                radius: 80.0,
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
              ),
              otherAccountsPictures: <Widget>[
                Image(
                  image: NetworkImage(
                      "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg"),
                  fit: BoxFit.cover,
                ),
                GFAvatar(
                  child: Text("ab"),
                )
              ],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('user name'),
                  Text('user@userid.com'),
                ],
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: null,
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: null,
            ),
          ],
        ),
      ),

      // Drawer(
      //   shape: Border.all(),
      //   child: ListView(
      //     children: [
      //       UserAccountsDrawerHeader(
      //         decoration: BoxDecoration(
      //           gradient: SweepGradient(
      //             // begin: Alignment.topLeft,
      //             // end: Alignment(0.8, 1),
      //             transform: GradientRotation(angel),
      //             colors: <Color>[
      //               Color(0xff1f005c),
      //               Color(0xff5b0060),
      //               Color(0xff870160),
      //               Color(0xffac255e),
      //               Color(0xffca485c),
      //               Color(0xffe16b5c),
      //               Color(0xfff39060),
      //               Color(0xffffb56b),
      //             ], // Gradient from https://learnui.design/tools/gradient-generator.html
      //             tileMode: TileMode.mirror,
      //           ),
      //         ),
      //         accountName: Text("ok"),
      //         accountEmail: Text("935764227@qq.com"),
      //         currentAccountPicture: CircleAvatar(
      //           backgroundImage: ExactAssetImage("assets/images/lufei.png"),
      //         ),
      //       ),
      //       ListTile(
      //         title: Text(
      //           'ok',
      //           // style: TextStyle(fontSize: angel * 20),
      //         ),
      //         leading: Icon(Icons.account_circle_outlined),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}

class mainPage extends StatefulWidget {
  var ki;
  var con;
  mainPage({this.ki, this.con, Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late TabController _tabController;
  late ScrollController _scrollController;
  var keyi = GlobalKey();
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    widget.con = ScrollController()
      ..addListener(() {
        print(widget.con.position.pixels);
      });
    // widget.con.addListener(() {
    //   print(widget.con.position.pixels);
    // });
    // print(widget.ki.currentContext._primaryScrollControlle);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      color: Colors.white,
      backgroundColor: Colors.blue,
      onRefresh: () async {
        print("123");
        Future.value();
        return Future<void>.delayed(const Duration(seconds: 3));
      },
      child: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: appBar_joko(innerBoxIsScrolled),
            )
          ];
        },
        body: listBody_joko(),
      ),
    );
  }

  CustomScrollView CustomScrollView_joko(context) {
    double height = (Random().nextInt(4) + 1) * 100;
    final _scorll = ScrollController();

    var _listkey = GlobalKey();
    final items = List.generate(100, (index) {
      int ys = index % 8 + 1;
      return LayoutId(
          id: "id_$index",
          child: Container(
            width: 200,
            height: 40 + Random().nextDouble() * 100,
            color: Colors.red[100 * ys],
            child: FlutterLogo(), //替换成你的图片控件
          ));
    });
    return CustomScrollView(
      // controller: widget.con,
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
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverPadding(
          padding: EdgeInsets.all(4),
          sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return list_card(index);
              }, childCount: 20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 300,
                // maxCrossAxisExtent: double.maxFinite,
                //长宽比
                childAspectRatio: 1.5,
                //列间距
                crossAxisSpacing: 5,
                //行间距
                mainAxisSpacing: 10,
                crossAxisCount: 2,
              )
              // SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 8,
              //     mainAxisSpacing: 8,
              //     childAspectRatio: 2)
              //     ),
              ),
          // SliverFillRemaining(
          //     // hasScrollBody: false,
          //     fillOverscroll: true,
          //     child: MasonryGridView.builder(
          //       key: _listkey,
          //       controller: _scrollController,
          //       // 展示几列
          //       // crossAxisCount: 2,
          //       // 元素总个数
          //       itemCount: 50,
          //       // 单个子元素
          //       itemBuilder: (BuildContext context, int index) {
          //         print('$height:$index');
          //         return list_card(index);
          //       },
          //       // 纵向元素间距
          //       mainAxisSpacing: 10,
          //       // 横向元素间距
          //       crossAxisSpacing: 10,
          //       //本身不滚动，让外面的singlescrollview来滚动
          //       physics: BouncingScrollPhysics(),
          //       shrinkWrap: true,
          //       gridDelegate:
          //           SliverSimpleGridDelegateWithFixedCrossAxisCount(
          //               crossAxisCount: 2), //收缩，让元素宽度自适应
          //     )
          //     // CustomMultiChildLayout(
          //     //   delegate: ProxyClass(items.length, 3, 5),
          //     //   children: items,
          //     // ),
          //     )

          // SliverList(
          //   delegate: SliverChildBuilderDelegate((context, index) {
          //     double height = (Random().nextInt(4) + 1) * 100;
          //     print((Random().nextDouble() * 5) + 1);
          //     return list_card(index, height);
          //   }, childCount: 10),
          // )
          // SliverAnimatedList(
          //   key: _listKey,
          //   initialItemCount: 1,
          //   itemBuilder: (context, index, Animation<double> animation) {
          //     return list_card(index);
          //   },
          // ),
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
        )
        // ),
        // ),
      ],
    );
  }

  TabBarView listBody_joko() {
    return TabBarView(
        controller: _tabController,
        physics: BouncingScrollPhysics(),
        children: [
          // GridView.builder(
          //   // scrollDirection: Axis.horizontal,
          //   controller: _scrollController,
          //   physics: const BouncingScrollPhysics(),
          //   primary: false,
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     mainAxisExtent: 300,
          //     // maxCrossAxisExtent: double.maxFinite,
          //     //长宽比
          //     childAspectRatio: 1.5,
          //     //列间距
          //     crossAxisSpacing: 5,
          //     //行间距
          //     mainAxisSpacing: 10,
          //     crossAxisCount: 2,
          //   ),
          //   itemBuilder: (context, index) {
          //     return list_card(index);
          //   },
          //   itemCount: 30,
          // ),
          SafeArea(
            top: false,
            bottom: false,
            child: Builder(
              builder: (context) {
                return
                    // MasonryGridView.count(
                    //   physics: const BouncingScrollPhysics(),
                    //   crossAxisCount: 2,
                    //   mainAxisSpacing: 4,
                    //   crossAxisSpacing: 4,
                    //   itemBuilder: (context, index) {
                    //     final height = (Random().nextInt(4) + 1) * 100;
                    //     print(height);
                    //     return Image.network(
                    //       'https://picsum.photos/100/$height?random=$index',
                    //       width: 100.toDouble(),
                    //       height: height.toDouble(),
                    //       fit: BoxFit.cover,
                    //     );
                    //   },
                    //   itemCount: 10,
                    // );
                    CustomScrollView_joko(context);
              },
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
            ),
          ),
          slide(),
          Center(
            child: Text("page3"),
          ),
        ]);
  }

  SliverAppBar appBar_joko(innerBoxIsScrolled) {
    return SliverAppBar(
      floating: true,
      snap: true,
      bottom: TabBar(
          physics: const BouncingScrollPhysics(),
          // enableFeedback: true,
          onTap: (value) {
            if (value == 0 && widget.con.hasClients) {
              // print(_scrollController.hasClients);
              widget.con.animateTo(0.00,
                  duration: Duration(seconds: 2), curve: Curves.easeOutBack);
            }
          },
          controller: _tabController,
          indicatorColor: Colors.green[400],
          tabs: [
            Tab(
              icon: Icon(
                Icons.cloud_outlined,
                color: Colors.green[400],
              ),
            ),
            Tab(
              icon: Icon(
                Icons.beach_access_sharp,
                color: Colors.green[400],
              ),
            ),
            Tab(
              icon: Icon(
                Icons.brightness_5_sharp,
                color: Colors.green[400],
              ),
            ),
          ]),
      leading: IconButton(
          onPressed: () {
            widget.ki.currentState!.openDrawer();
          },
          icon: Icon(Icons.ac_unit)),
      expandedHeight: 200,
      centerTitle: true,
      forceElevated: innerBoxIsScrolled,
      // title: Text("nihao"),
      // floating: true,
      pinned: true,
      // snap: true,
      stretch: true,
      onStretchTrigger: () async {
        print('onStretchTrigger');
        return;
      },
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        background: Image.asset(
          "assets/images/top.png",
          fit: BoxFit.cover,
        ),
        // title: Icon(
        //   color: Colors.green[100],
        //   Icons.airplanemode_active,
        //   textDirection: TextDirection.rtl,
        // )
      ),
    );
  }

  IntrinsicHeight list_card(int index) {
    final _listHeight = <int>[100, 200, 200, 300, 400, 200, 300, 400, 200, 100];
    return IntrinsicHeight(
        child: GestureDetector(
      onTap: () {
        _scrollController.animateTo(0.00,
            duration: Duration(seconds: 2), curve: Curves.easeOutBack);
      },
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                width: double.infinity,
                // height: height,

                // height: 10,
                // height: ((Random().nextDouble() * 3) + 7) * 20,
                // padding: EdgeInsets.all(2),
                child: Card(
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    'https://picsum.photos/300/300?random=$index',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    // width: double.maxFinite,
                    height: index % 2 == 0 ? 200 : 300,
                  ),
                )),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Text(
              'hello$index',
            ),
          ),
          // Flexible(
          //   child: Text(
          //     'hello',
          //     textDirection: TextDirection.ltr,
          //   ),
          // ),
          // Flexible(
          //   child: Text(
          //     'hello',
          //     textDirection: TextDirection.ltr,
          //   ),
          // ),
          // Flexible(
          //   child: Text(
          //     'hello',
          //     textDirection: TextDirection.ltr,
          //   ),
          // ),
          // Flexible(
          //   child: Text(
          //     'hello',
          //     textDirection: TextDirection.ltr,
          //   ),
          // ),
          // Flexible(
          //   child: Text(
          //     'hello',
          //     textDirection: TextDirection.ltr,
          //   ),
          // )
        ],
      ),
    ));
  }
}

Widget slide() {
  return Slidable(
    // Specify a key if the Slidable is dismissible.
    key: const ValueKey(0),

    // The start action pane is the one at the left or the top side.
    startActionPane: ActionPane(
      // A motion is a widget used to control how the pane animates.
      motion: const ScrollMotion(),

      // A pane can dismiss the Slidable.
      dismissible: DismissiblePane(onDismissed: () {}),

      // All actions are defined in the children parameter.
      children: [
        // A SlidableAction can have an icon and/or a label.
        SlidableAction(
          onPressed: (context) {},
          backgroundColor: Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
        SlidableAction(
          onPressed: (context) {},
          backgroundColor: Color(0xFF21B7CA),
          foregroundColor: Colors.white,
          icon: Icons.share,
          label: 'Share',
        ),
      ],
    ),

    // The end action pane is the one at the right or the bottom side.
    endActionPane: ActionPane(
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          // An action can be bigger than the others.
          flex: 2,
          onPressed: (context) {},
          backgroundColor: Color(0xFF7BC043),
          foregroundColor: Colors.white,
          icon: Icons.archive,
          label: 'Archive',
        ),
        SlidableAction(
          onPressed: (context) {},
          backgroundColor: Color(0xFF0392CF),
          foregroundColor: Colors.white,
          icon: Icons.save,
          label: 'Save',
        ),
      ],
    ),

    // The child of the Slidable is what the user sees when the
    // component is not dragged.
    child: const ListTile(title: Text('Slide me'), focusColor: Colors.red),
  );
}

//body
class ProxyClass extends MultiChildLayoutDelegate {
  int num;
  int columnNum;
  int padding;

  ProxyClass(this.num, this.columnNum, this.padding);

  @override
  void performLayout(Size size) {
    double lastWidth = size.width - columnNum * padding;
    double itemWidth = lastWidth / columnNum;
    double offsetX = 0;
    List columnH = List.generate(columnNum, (index) {
      return 0.0;
    });
    for (int i = 0; i < num; i++) {
      int ys = i % columnNum;
      print("$ys === ${columnH[ys]}");
      Size itemSize = layoutChild(
          "id_$i",
          BoxConstraints(
              minWidth: itemWidth,
              maxWidth: itemWidth,
              minHeight: 0,
              maxHeight: 1000));
      positionChild("id_$i", Offset(offsetX + padding * 0.5, columnH[ys]));
      offsetX += padding + itemWidth;
      if (offsetX >= size.width - 1) {
        offsetX = 0;
      }
      columnH[ys] += itemSize.height + padding;
      print("size : ${columnH[ys]}----$offsetX");
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}
