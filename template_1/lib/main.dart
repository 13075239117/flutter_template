import 'dart:ui';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
              backgroundColor: Colors.orange[600],
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
  late ScrollController _primaryScrollController;
  @override
  void initState() {
    _primaryScrollController = ScrollController();
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    // _primaryScrollController.addListener(() {
    //   print(_primaryScrollController.position.pixels);
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
      _primaryScrollController.animateTo(
        0.00,
        duration: const Duration(milliseconds: 1500),
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
    _scrollController = ScrollController()
      ..addListener(() {
        print(_scrollController.position.pixels);
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
      child: CustomScrollView(
        controller: widget.con,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            bottom: TabBar(
                physics: NeverScrollableScrollPhysics(),
                // enableFeedback: true,
                onTap: (value) {
                  if (value == 0 && widget.con.hasClients) {
                    // print(_scrollController.hasClients);
                    widget.con.animateTo(0.00,
                        duration: Duration(seconds: 2),
                        curve: Curves.easeOutBack);
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
            // title: Text("nihao"),
            floating: true,
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
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate((context, index) {
          //     return ListTile(
          //       leading: Text("1"),
          //       title: Text("ok"),
          //     );r
          //   }, childCount: 20),
          // ),
          SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverFillRemaining(
              child: TabBarView(
                  controller: _tabController,
                  physics: BouncingScrollPhysics(),
                  children: [
                    GridView.builder(
                      // scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      primary: false,
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
                      ),
                      itemBuilder: (context, index) {
                        return list_card(index);
                      },
                      itemCount: 30,
                    ),
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
                    Center(
                      child: Text("page2"),
                    ),
                    Center(
                      child: Text("page3"),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Container list_card(int index) {
    return Container(
      // height: 500,
      // decoration: BoxDecoration(
      //     // shape: BoxShape.rectangle,
      //     border: Border.all(),
      //     borderRadius: BorderRadius.all(Radius.circular(5))),
      // width: double.maxFinite,
      // height: double.maxFinite,
      // color: Color.fromARGB(255, Random().nextInt(256),
      //     Random().nextInt(256), Random().nextInt(256)),
      // child: Text("$index"),
      child: LayoutBuilder(builder: (context, constrains) {
        return GestureDetector(
          onTap: () {
            print(constrains);
          },
          child: Card(
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Expanded(
                child: Image.network(
                  'https://picsum.photos/200/300?random=$index',
                  width: constrains.maxWidth,
                  scale: 2,
                  // height: constrains.maxHeight,
                  // height: double.,
                  // width: width.toDouble(),
                  // height: 300,
                  fit: BoxFit.fill,
                ),
              ),
              const ListTile(
                leading: Icon(Icons.album),
                title: Text(
                  'The Enchanted Nightingale',
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
                // subtitle: Text(
                //     'Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: <Widget>[
              //     TextButton(
              //       child: const Text('BUY TICKETS'),
              //       onPressed: () {/* ... */},
              //     ),
              //     // Expanded(child: const SizedBox(width: 8)),
              //     TextButton(
              //       child: const Text('LISTEN'),
              //       onPressed: () {/* ... */},
              //     ),
              //     const SizedBox(width: 8),
              //   ],
              // ),
            ]),
          ),
        );
      }),

      //     Image.network(/
      //   'https://picsum.photos/200/300?random=$index',
      //   // width: width.toDouble(),
      //   // height: height.toDouble(),
      //   fit: BoxFit.fill,
      // )
    );
  }
}
//body
