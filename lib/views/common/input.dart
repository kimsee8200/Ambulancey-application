import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/color.dart';

class TextInput extends StatefulWidget {
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;
  final int? maxLength;
  final String placeholder;
  final int? defaultLine;
  final bool obscure;
  const TextInput({super.key, this.onChanged, this.onSubmitted, this.controller, this.maxLength, this.placeholder = "", this.defaultLine, this.obscure = false});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged??(_){},
      onSubmitted: widget.onSubmitted??(_){},
      maxLength: widget.maxLength,
      cursorColor: Colors.black,
      obscureText: widget.obscure,
      cursorWidth: 1,
      cursorHeight: 16,
      maxLines: (widget.defaultLine != null) ? null : 1,
      minLines: widget.defaultLine,
      style: const TextStyle(fontSize: 13),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        filled: true,
        fillColor: gray50,
        hoverColor: gray50,
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: gray500, width: 2), borderRadius: BorderRadius.all(Radius.circular(15))),
        border: const OutlineInputBorder(borderSide: BorderSide(color: gray500, width: 2), borderRadius: BorderRadius.all(Radius.circular(15))),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: gray500, width: 2), borderRadius: BorderRadius.all(Radius.circular(15))),
        hintText: widget.placeholder,
        hintStyle: const TextStyle(color: gray500),
        counterText: ''
      )
    );
  }
}

class PasswordInput extends StatefulWidget {
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;
  final int? maxLength;
  final String placeholder;
  final int? defaultLine;
  const PasswordInput({super.key, this.onChanged, this.onSubmitted, this.controller, this.maxLength, this.placeholder = "", this.defaultLine});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged??(_){},
      onSubmitted: widget.onSubmitted??(_){},
      maxLength: widget.maxLength,
      cursorColor: Colors.black,
      obscureText: !_passwordVisible,
      obscuringCharacter: '.',
      cursorWidth: 1,
      cursorHeight: 16,
      maxLines: (widget.defaultLine != null) ? null : 1,
      minLines: widget.defaultLine,
      style: const TextStyle(fontSize: 13),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        filled: true,
        fillColor: gray50,
        hoverColor: gray50,
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: gray500, width: 2), borderRadius: BorderRadius.all(Radius.circular(15))),
        border: const OutlineInputBorder(borderSide: BorderSide(color: gray500, width: 2), borderRadius: BorderRadius.all(Radius.circular(15))),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: gray500, width: 2), borderRadius: BorderRadius.all(Radius.circular(15))),
        hintText: widget.placeholder,
        hintStyle: const TextStyle(color: gray500),
        counterText: '',
        suffixIcon: IconButton(
          icon: Icon(
            !_passwordVisible
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
            color: gray500,
            size: 20
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          }
        )
      )
    );
  }
}