import 'package:flutter/material.dart';

class SearchBarComponent extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  const SearchBarComponent({Key? key, this.onChanged}) : super(key: key);

  @override
  _SearchBarComponentState createState() => _SearchBarComponentState();
}

class _SearchBarComponentState extends State<SearchBarComponent> {
  FocusNode _focusNode = FocusNode();
  Color _borderColor = Color(0xffd2bffa);

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _borderColor =
            _focusNode.hasFocus ? Color(0xFF3e1cb7) : Color(0xffd2bffa);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: _borderColor, width: 2),
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        focusNode: _focusNode,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(color: Color(0xffa3a3a3), fontSize: 19),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Color(0xFF3e1cb7)),
        ),
      ),
    );
  }
}
