import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template_1/pages/HomePage/customScrollView_joko.dart';

class tarBarView extends StatefulWidget {
  late TabController tabController;
  tarBarView({Key? key, required this.tabController}) : super(key: key);

  @override
  State<tarBarView> createState() => _tarBarViewState();
}

class _tarBarViewState extends State<tarBarView> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
        controller: widget.tabController,
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
                    customScrollView_joko(context: context);
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
          // slide(),
          Center(
            child: Text("page2"),
          ),
          Center(
            child: Text("page3"),
          ),
        ]);
  }
}
