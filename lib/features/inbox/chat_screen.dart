import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Direct messages'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: FaIcon(
              FontAwesomeIcons.plus,
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Text("우현"),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("임우현"),
                Text(
                  '2:16 PM',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            subtitle: Text("Say hi to 임우현"),
          )
        ],
      ),
    );
  }
}
