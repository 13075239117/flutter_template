import 'package:flutter/cupertino.dart';
import 'package:template_1/pages/HomePage/animate_list.dart';

class customScrollView_joko extends StatefulWidget {
  BuildContext context;
  customScrollView_joko({Key? key, required this.context}) : super(key: key);

  @override
  State<customScrollView_joko> createState() => _customScrollView_jokoState();
}

class _customScrollView_jokoState extends State<customScrollView_joko> {
  @override
  Widget build(BuildContext context) {
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
          handle:
              NestedScrollView.sliverOverlapAbsorberHandleFor(widget.context),
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

              //     SliverList(
              //   key: _listKey,
              //   delegate: SliverChildBuilderDelegate((context, index) {
              //     double height = (Random().nextInt(4) + 1) * 100;
              //     print('$index');
              //     return AnimatedBuilder(
              //         animation: _curvedAnimation,
              //         builder: (context, index1) {
              //           return FadeTransition(
              //               opacity: _curvedAnimation, child: list_card(index));
              //         });
              //   }, childCount: 10),
              // ),
              SliverAnimatedList(
            // key: _listKey,
            initialItemCount: 10,
            itemBuilder: (context, index, Animation<double> animation) {
              print('$index');
              // _animationController.forward();

              return animate_list(
                index: index,
                animation: animation,
              );
              // FadeTransition(
              //     key: GlobalKey(),
              //     opacity: _curvedAnimation,
              //     child: list_card(index)
              //     );
            },
          ),
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
}
