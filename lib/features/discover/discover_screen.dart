import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/src/widgets/scroll_position.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  static List<String> tabs = [
    "Top",
    "Users",
    "Videos",
    "Sounds",
    "LIVE",
    "Shopping",
    "Brands"
  ];

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  late final TextEditingController _controller;
  late final ScrollController _scrollController;
  late final TabController _tabController;

  void _onStopWriting() {
    FocusScope.of(context).unfocus();
  }

  void _onClearTap() {
    _controller.clear();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _scrollController = ScrollController();
    _tabController = TabController(length: 7, vsync: this);

    // Code Challenge : onTapTabBar Event
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          print(_tabController.index);
          print(_tabController.animation!.value);
          FocusScope.of(context).unfocus();
        });
      }
    });

    // Code Challenge : Scorolling Event
    _scrollController.addListener(() {
      if (FocusScope.of(context).hasFocus) {
        if (_scrollController.position.activity!.isScrolling) {
          setState(() {
            FocusScope.of(context).unfocus();
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            // focusNode: _focusNode,
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: Colors.grey.withOpacity(0.19),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),
                child: FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              suffix: GestureDetector(
                onTap: _onClearTap,
                child: const FaIcon(
                  FontAwesomeIcons.solidCircleXmark,
                  color: Colors.black54,
                  size: 20,
                ),
              ),
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(horizontal: 0),
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            labelStyle: const TextStyle(fontWeight: FontWeight.w600),
            tabs: [
              for (var tab in DiscoverScreen.tabs)
                Tab(
                  text: tab,
                )
            ],
          ),
        ),
        // Code Challenge : Scrolling to left and right Event on TapbarView
        body: NotificationListener<ScrollStartNotification>(
          onNotification: (ScrollStartNotification notification) {
            FocusScope.of(context).unfocus();
            return true;
          },
          child: TabBarView(
            controller: _tabController,
            children: [
              GestureDetector(
                onTap: _onStopWriting,
                child: GridView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 9 / 20,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: AspectRatio(
                          aspectRatio: 9 / 16,
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: "assets/images/cdt2.jpg",
                            image:
                                "https://www.purina.co.nz/sites/default/files/styles/ttt_image_510/public/2021-01/Coton%20De%20Tulear2.jpg?itok=VH9vegcB",
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'This is a very long caption for my tictok that im upload just now currently.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 16,
                              child: Text('이름'),
                            ),
                            const SizedBox(width: 5),
                            const Expanded(
                              child: Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                '\$name',
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.heart,
                              size: 16,
                              color: Colors.grey.shade700,
                            ),
                            const SizedBox(width: 5),
                            const Text('\$likes')
                          ],
                        ),
                      )
                    ],
                  ),
                  itemCount: 20,
                ),
              ),
              for (var tab in DiscoverScreen.tabs.skip(1))
                Center(
                  child: Text(
                    tab,
                    style: const TextStyle(
                      fontSize: 44,
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
