import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/drawer/gf_drawer.dart';
import 'package:getwidget/components/drawer/gf_drawer_header.dart';
import 'package:template_1/pages/HomePage/mainPage.dart';

class MyHomePage_joko extends StatefulWidget {
  MyHomePage_joko({Key? key}) : super(key: key);

  @override
  State<MyHomePage_joko> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage_joko>
    with TickerProviderStateMixin {
  int selected = 0;
  late AnimationController am;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double angel = 0;

  late TabController tabController;
  late ScrollController _primaryScrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
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
