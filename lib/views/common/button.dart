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

class SmallButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool enabled;
  const SmallButton({super.key, required this.text, required this.onPressed, this.enabled = true});

  @override
  State<SmallButton> createState() => _SmallButtonState();
}
class _SmallButtonState extends State<SmallButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.enabled ? widget.onPressed : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 90,
          height: 30,
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

class FloatingButton extends StatefulWidget {
  final VoidCallback onPressed;

  const FloatingButton({super.key, required this.onPressed});

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500)
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _rotateIcon() {
    widget.onPressed();
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _rotateIcon,
      mini: true,
      backgroundColor: blue400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      child: AnimatedBuilder(
        animation: _animation,
        child: const Icon(Icons.refresh, color: Colors.white, size: 20),
        builder: (context, child) {
          return Transform.rotate(
            angle: _animation.value * 2 * 3.14159,
            child: child
          );
        }
      )
    );
  }
}