import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template_1/main.dart';
import 'package:template_1/pages/HomePage/TabBarView_joko.dart';
import 'package:template_1/pages/HomePage/sliverAppBar_joko.dart';

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
  late AnimationController _animationController;
  late Animation animation;
  late CurvedAnimation _curvedAnimation;
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
        // print(widget.con.position.pixels);
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      color: Colors.red,
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
              sliver: sliverAppBar(
                  innerBoxIsScrolled: innerBoxIsScrolled,
                  tabController: _tabController),
            )
          ];
        },
        body: tarBarView(tabController: _tabController),
      ),
    );
  }
}
