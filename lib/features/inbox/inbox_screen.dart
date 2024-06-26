import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/inbox/activity_screen.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  void _onActivityTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ActivityScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Inbox'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.comments,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => _onActivityTap(context),
            title: const Text(
              'Activity',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
              size: 18,
            ),
          ),
          Container(
            height: 0.3,
            color: Colors.grey.shade300,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.lightBlue.shade600,
              radius: 30,
              child: const FaIcon(
                FontAwesomeIcons.userGroup,
                color: Colors.white,
                size: 20,
              ),
            ),
            title: const Text(
              'New followers',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            subtitle: const Text(
              'Messages from followers will appear here',
              style: TextStyle(fontSize: 16),
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
              size: 18,
            ),
          )
        ],
      ),
    );
  }
}
