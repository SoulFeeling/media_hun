import 'package:flutter/material.dart';

class MediaDetailIntroduce extends StatefulWidget {
  final String content;
  const MediaDetailIntroduce({Key? key, required this.content}) : super(key: key);

  @override
  _MediaDetailIntroduceState createState() => _MediaDetailIntroduceState();
}

class _MediaDetailIntroduceState extends State<MediaDetailIntroduce> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final String content = widget.content;

    final TextSpan fullText = TextSpan(
      text: content,
      style: const TextStyle(fontSize: 16),
    );

    final TextPainter textPainter = TextPainter(
      text: fullText,
      maxLines: 3,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: MediaQuery.of(context).size.width - 32.0);

    final bool isOverflowing = textPainter.didExceedMaxLines;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '剧情简介',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          if (isOverflowing)
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Stack(
                children: [
                  Text(
                    content,
                    style: const TextStyle(fontSize: 12),
                    maxLines: _isExpanded ? null : 3,
                    overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                  ),
                  if (!_isExpanded)
                    Positioned(
                      bottom: 0,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isExpanded = true;
                          });
                        },
                        child: Container(
                          color: Colors.white,
                          child: Text(
                            ' 全部>',
                            style: TextStyle(color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            )
          else
            Text(
              content,
              style: const TextStyle(fontSize: 16),
            ),
          if (isOverflowing && _isExpanded)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _isExpanded = false;
                  });
                },
                child: Text(
                  '收起',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
