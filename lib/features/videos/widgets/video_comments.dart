import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/videos/widgets/video_stat_button.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  final ScrollController _scrollController = ScrollController();

  bool _isWriting = false;

  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  void _onStopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = true;
    });
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onStopWriting,
      child: Container(
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
          body: Stack(
            children: [
              Scrollbar(
                controller: _scrollController,
                child: ListView.separated(
                  controller: _scrollController,
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 60.w,
                  ),
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
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: 10,
                ),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: 0,
                child: BottomAppBar(
                  elevation: 0,
                  color: Colors.white,
                  child: Row(
                    children: [
                      const CircleAvatar(),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 44,
                          child: TextField(
                            onTap: _onStartWriting,
                            textInputAction: TextInputAction.newline,
                            expands: true,
                            maxLines: null,
                            minLines: null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              hintText: 'Add comment...',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                              suffixIcon: const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FaIcon(FontAwesomeIcons.at),
                                    SizedBox(width: 10),
                                    FaIcon(FontAwesomeIcons.gift),
                                    SizedBox(width: 10),
                                    FaIcon(FontAwesomeIcons.faceSmile),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Offstage(
                        offstage: _isWriting,
                        child: GestureDetector(
                          onTap: _onStopWriting,
                          child: IconButton(
                            onPressed: _onStopWriting,
                            icon: const FaIcon(FontAwesomeIcons.paperPlane),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
