import 'package:flutter/material.dart';

class StfWidget extends StatefulWidget {
  const StfWidget({super.key});

  @override
  State<StfWidget> createState() => _StfWidgetState();
}

class _StfWidgetState extends State<StfWidget> {
  int cnt = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$cnt'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                cnt = cnt + 1;
              });
            },
            child: const Text('+'),
          )
        ],
      ),
    );
  }
}
