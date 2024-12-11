import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class SCollapse extends StatefulWidget {
  final String title;
  final String content;

  const SCollapse({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  _SCollapseState createState() => _SCollapseState();
}

class _SCollapseState extends State<SCollapse> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double containerPaddingHorizontal = 10.0; // 标题容器水平内边距
    double markdownPaddingAll = 16.0; // Markdown 内容区的所有方向内边距

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                Icon(
                  _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Colors.blueAccent,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: _isExpanded ? null : 0,
          curve: Curves.easeInOut,
          child: _isExpanded
              ? Container(
            width: MediaQuery.of(context).size.width - (containerPaddingHorizontal + markdownPaddingAll) * 2,
            padding: EdgeInsets.all(markdownPaddingAll),
            decoration: BoxDecoration(
              color: Colors.grey[50], // 使用相同的背景色
            ),
            child: MarkdownBody(
              data: widget.content,
              styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)),
            ),
          )
              : SizedBox.shrink(),
        ),
      ],
    );
  }
}