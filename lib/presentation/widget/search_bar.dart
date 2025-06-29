import 'package:flutter/material.dart';

class SearchBarComponent extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  const SearchBarComponent({Key? key, this.onChanged}) : super(key: key);

  @override
  _SearchBarComponentState createState() => _SearchBarComponentState();
}

class _SearchBarComponentState extends State<SearchBarComponent> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  Color _borderColor = const Color(0xffd2bffa);

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _borderColor =
            _focusNode.hasFocus
                ? const Color(0xFF3e1cb7)
                : const Color(0xffd2bffa);
      });
    });

    _controller.addListener(() {
      setState(() {}); // لعرض زر clear عند وجود نص
    });
  }

  void _clearText() {
    _controller.clear();
    widget.onChanged?.call('');
    FocusScope.of(context).unfocus(); // إخفاء الكيبورد
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
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
        controller: _controller,
        focusNode: _focusNode,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: const TextStyle(color: Color(0xffa3a3a3), fontSize: 19),
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.search, color: Color(0xFF3e1cb7)),
          suffixIcon:
              _controller.text.isNotEmpty
                  ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.grey),
                    onPressed: _clearText,
                  )
                  : null,
        ),
      ),
    );
  }
}
