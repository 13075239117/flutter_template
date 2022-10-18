import 'package:flutter/material.dart';
import 'package:template_1/pages/HomePage/customScrollView_joko/index.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}
