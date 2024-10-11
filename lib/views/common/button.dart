import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/color.dart';

class LargeButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool enabled;
  const LargeButton({super.key, required this.text, required this.onPressed, this.enabled = true});

  @override
  State<LargeButton> createState() => _LargeButtonState();
}
class _LargeButtonState extends State<LargeButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.enabled ? widget.onPressed : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: widget.enabled ? blue400 : gray300,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(0, 4)
              )
            ]
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(child: Text(widget.text, style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)))
        )
      )
    );
  }
}