import 'package:flutter/material.dart';

class Commment extends StatefulWidget {
  const Commment({super.key});

  @override
  State<Commment> createState() => _CommmentState();
}

class _CommmentState extends State<Commment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 70,
            child: Center(
              child: Text(
                "全部评论",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Divider(thickness: 1),
          Expanded(
            child: ListView.builder(
              itemCount: 21,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    OverlayState? state = Overlay.of(context);
                    OverlayEntry overlayEntry =
                        OverlayEntry(builder: (context) {
                      return Material(
                        type: MaterialType.transparency,
                        child: SizedBox(
                          width: 200,
                          height: 100,
                          child: Center(
                              child: TextField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.person),
                            ),
                          )),
                        ),
                      );
                    });
                    state?.insert(overlayEntry);
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.red,
                      // backgroundImage:
                      //     NetworkImage(_listData[widget.index].avatar),
                      // backgroundColor: Colors.brown.shade800,
                      child: Text("测试", textAlign: TextAlign.center),
                      radius: 15,
                    ),
                    title: Text("咩咩阿三大苏打实打实大苏打实打实"),
                    subtitle: Text(
                      "2022-10-19",
                      textAlign: TextAlign.right,
                    ),
                    trailing: Text("123123"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
