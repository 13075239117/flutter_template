import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class sliverAppBar extends StatefulWidget {
  // bool innerBoxIsScrolled;
  late TabController tabController;
  sliverAppBar({Key? key, required this.tabController}) : super(key: key);

  @override
  State<sliverAppBar> createState() => _sliverAppBarState();
}

class _sliverAppBarState extends State<sliverAppBar>
    with TickerProviderStateMixin {
  // late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    // _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      // bottom: TabBar(
      //     physics: const BouncingScrollPhysics(),
      //     // enableFeedback: true,
      //     onTap: (value) {
      //       // if (value == 0 && widget.con.hasClients) {
      //       //   // print(_scrollController.hasClients);
      //       //   widget.con.animateTo(0.00,
      //       //       duration: Duration(seconds: 2), curve: Curves.easeOutBack);
      //       // }
      //     },
      //     controller: widget.tabController,
      //     indicatorColor: Colors.green[400],
      //     tabs: [
      //       Tab(
      //         icon: Icon(
      //           Icons.cloud_outlined,
      //           color: Colors.green[400],
      //         ),
      //       ),
      //       Tab(
      //         icon: Icon(
      //           Icons.beach_access_sharp,
      //           color: Colors.green[400],
      //         ),
      //       ),
      //       Tab(
      //         icon: Icon(
      //           Icons.brightness_5_sharp,
      //           color: Colors.green[400],
      //         ),
      //       ),
      //     ]),
      leading: IconButton(
          onPressed: () {
            // widget.ki.currentState!.openDrawer();
          },
          icon: Icon(Icons.ac_unit)),
      expandedHeight: 200,
      centerTitle: true,
      // forceElevated: widget.innerBoxIsScrolled,
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
}
