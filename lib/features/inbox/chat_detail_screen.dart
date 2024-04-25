import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatDetailStreen extends StatefulWidget {
  const ChatDetailStreen({super.key});

  @override
  State<ChatDetailStreen> createState() => _ChatDetailStreenState();
}

class _ChatDetailStreenState extends State<ChatDetailStreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: 10,
          leading: Stack(
            children: [
              Positioned(
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.lightBlue.shade700,
                  child: const FaIcon(
                    FontAwesomeIcons.solidUser,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                right: 2,
                bottom: 2,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Colors.lightGreen,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          title: const Text(
            'Wuhyun0111',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            'Active now',
            style: TextStyle(
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(FontAwesomeIcons.flag),
              SizedBox(width: 30),
              FaIcon(FontAwesomeIcons.ellipsis)
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            const Expanded(
              child: TextField(),
            ),
            IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.paperPlane),
            ),
          ],
        ),
      ),
    );
  }
}
