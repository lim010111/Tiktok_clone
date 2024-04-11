import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.indigo
  ];

  void _onPageChanged(int page) {
    if (page == _itemCount - 1) {
      setState(() {});
      _itemCount = _itemCount + 4;
      colors.addAll([
        Colors.red,
        Colors.green,
        Colors.blue,
        Colors.indigo,
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      onPageChanged: _onPageChanged,
      itemCount: _itemCount,
      itemBuilder: (context, index) => Container(
        color: colors[index],
        child: Center(
          child: Text("Screen $index"),
        ),
      ),
    );
  }
}
