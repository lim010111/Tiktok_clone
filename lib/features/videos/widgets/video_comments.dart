import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/videos/widgets/video_stat_button.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          title: const Text('\$values Comments'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: _onClosePressed,
              icon: const FaIcon(
                FontAwesomeIcons.xmark,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text('유저'),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$name',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const Text(
                      '\$texts................',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                        '\$repliesrepliesrepliesrepliesrepliesrepliesrepliesrepliesrepliesrepliesrepliesrepliesrepliesrepliesrepliesrepliesrepliesrepliesrepliesreplies')
                  ],
                ),
              ),
              VideoStatButton(
                icon: FontAwesomeIcons.heart,
                text: '\$values',
                color: Colors.grey.shade700,
                size: 20,
              )
            ],
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: 4,
        ),
        bottomNavigationBar: const BottomAppBar(
          elevation: 0,
          color: Colors.white,
          child: Row(
            children: [
              CircleAvatar(),
              Expanded(
                child: TextField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
