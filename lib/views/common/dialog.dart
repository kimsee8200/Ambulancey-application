import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/button.dart';
import 'package:ambulancey/views/common/color.dart';

class ModalDialog extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback onAccept;
  final VoidCallback? onReject;

  const ModalDialog({
    super.key,
    required this.title,
    required this.child,
    required this.onAccept,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: blue400,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.24,
          )
        )
      ),
      content: SizedBox(
        width: 200,
        height: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: child
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallButton(
                  text: '확인',
                  onPressed: () {
                    onAccept();
                    Navigator.of(context).pop();
                  },
                ),
                if (onReject != null)
                  TextButton(
                    onPressed: () {
                      onReject!();
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      overlayColor: Colors.transparent
                    ),
                    child: const Text(
                      '취소하기',
                      style: TextStyle(
                        color: gray400,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )
                    )
                  )
              ]
            )
          ]
        )
      )
    );
  }
}