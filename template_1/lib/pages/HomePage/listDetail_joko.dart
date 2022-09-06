import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Todo {
  final String name;
  final String age;

  Todo(this.name, this.age);
}

class listDetail extends StatefulWidget {
  listDetail({Key? key}) : super(key: key);

  @override
  State<listDetail> createState() => _listDetailState();
}

class _listDetailState extends State<listDetail> {
  @override
  Widget build(BuildContext context) {
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
            title: Text(todo['name']),
            subtitle: Text(todo['age']),
          ),
        ),
      ),
    );
  }
}
