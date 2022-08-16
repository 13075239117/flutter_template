import 'package:flutter/material.dart';

Future<void> push_joko(BuildContext context, page) async {
  // Navigator.push returns a Future that completes after calling
  // Navigator.pop on the Selection Screen.
  Navigator.push(
    context,
    // Create the SelectionScreen in the next step.
    MaterialPageRoute(builder: (context) => page()),
  );
}
