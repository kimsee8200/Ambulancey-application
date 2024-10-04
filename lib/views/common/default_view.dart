import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/color.dart';

class DefaultView extends StatelessWidget {
  final Widget child;
  final VoidCallback? onBack;
  const DefaultView({super.key, required this.child, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: onBack != null ? AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: gray500),
          onPressed: onBack
        ),
        elevation: 0,
        backgroundColor: Colors.transparent
      ) : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: child
        )
      )
    );
  }
}
