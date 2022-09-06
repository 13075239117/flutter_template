import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_1/models/test.dart';

import 'animate_list/models/index.dart';

class Todo {
  final String name;
  final String age;

  Todo(this.name, this.age);
}

class listDetail extends StatefulHookConsumerWidget {
  listDetail({Key? key}) : super(key: key);

  @override
  _listDetailState createState() => _listDetailState();
}

class _listDetailState extends ConsumerState<listDetail> {
  @override
  Widget build(BuildContext context) {
    final value = ref.watch(helloWorldProvider);
    final photo = ref.watch(detailProvoder);
    print(photo);
    final todo = ModalRoute.of(context)!.settings.arguments as Map;
    print(todo['name']);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Close the screen and return "Yep!" as the result.
            Navigator.pop(context, 'return');
            // context.pop();
          },
          child: ListTile(
            title: Text("$value"),
            subtitle: Text(todo['age']),
          ),
        ),
      ),
    );
  }
}
