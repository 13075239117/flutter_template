import 'dart:ui';
import 'dart:math';
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
          appBarTheme: const AppBarTheme(
              // backgroundColor: Colors.white,
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

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
  mainPage({this.ki, Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          leading: IconButton(
              onPressed: () {
                widget.ki.currentState!.openDrawer();
              },
              icon: Icon(Icons.ac_unit)),
          expandedHeight: 200,
          centerTitle: true,
          // title: Text("nihao"),
          floating: true,
          // pinned: true,
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
              title: Icon(
                color: Colors.green[100],
                Icons.airplanemode_active,
                textDirection: TextDirection.rtl,
              )),
        ),
        // SliverList(
        //   delegate: SliverChildBuilderDelegate((context, index) {
        //     return ListTile(
        //       leading: Text("1"),
        //       title: Text("ok"),
        //     );r
        //   }, childCount: 20),
        // ),
        SliverSafeArea(
          sliver: SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
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
                  child: Card(
                    child: Image.network(
                      'https://picsum.photos/200/300?random=$index',
                      // width: width.toDouble(),
                      // height: height.toDouble(),
                      fit: BoxFit.cover,
                    ),
                  ),

                  //     Image.network(
                  //   'https://picsum.photos/200/300?random=$index',
                  //   // width: width.toDouble(),
                  //   // height: height.toDouble(),
                  //   fit: BoxFit.fill,
                  // )
                );
              }, childCount: 20),
              gridDelegate: SliverWovenGridDelegate.count(
                pattern: [
                  WovenGridTile(1),
                  WovenGridTile(
                    5 / 7,
                    crossAxisRatio: 0.9,
                    alignment: AlignmentDirectional.centerEnd,
                  ),
                ],
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              // SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 8,
              //     mainAxisSpacing: 8,
              //     childAspectRatio: 2)
              //     ),
            ),
          ),
        )
      ],
    );
  }
}
//body
