import 'package:flutter/material.dart';
import 'package:ambulancey/views/home/root.dart';

class WidgetTest extends StatelessWidget {
  const WidgetTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          ElevatedButton(
            onPressed: ()=>Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Root()
              )
            ),
            child: const Text('run')
          )
        ]
      )
    ));
  }
}
