import 'package:flutter/material.dart';
import 'package:ambulancey/views/common/color.dart';

class TextDropdown extends StatefulWidget {
  final List<String> items;
  final String placeholder;
  final Function(String?) onChanged;

  const TextDropdown({
    super.key,
    required this.items,
    required this.placeholder,
    required this.onChanged,
  });

  @override
  State<TextDropdown> createState() => _TextDropdownState();
}

class _TextDropdownState extends State<TextDropdown> {
  String? _selectedItem;
  bool _isExpanded = false;
  final LayerLink _layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CompositedTransformTarget(
          link: _layerLink,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
              if (_isExpanded) {
                _showDropdown();
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: gray50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: gray500, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedItem ?? widget.placeholder,
                    style: TextStyle(
                      color: _selectedItem != null ? Colors.black : gray500,
                      fontSize: 13,
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: gray500,
                  )
                ]
              )
            )
          )
        )
      ]
    );
  }

  void _showDropdown() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    showMenu<String>(
      context: context,
      color: white,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          renderBox.localToGlobal(Offset.zero, ancestor: overlay),
          renderBox.localToGlobal(size.bottomRight(Offset.zero), ancestor: overlay),
        ),
        Offset.zero & overlay.size,
      ),
      items: [
        PopupMenuItem<String>(
          value: null,
          child: Text(widget.placeholder, style: const TextStyle(color: blue400, fontSize: 13)),
        ),
        ...widget.items.map((String item) => PopupMenuItem<String>(
          value: item,
          child: Text(item, style: const TextStyle(color: blue400, fontSize: 13)),
        )),
      ],
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ).then((String? newValue) {
      if (newValue != null) {
        setState(() {
          _selectedItem = newValue;
        });
      } else {
        _selectedItem = null;
      }
      widget.onChanged(newValue);
      setState(() {
        _isExpanded = false;
      });
    });
  }
}