import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DiscoverScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('discover'),
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(horizontal: 0),
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            labelStyle: const TextStyle(fontWeight: FontWeight.w600),
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 9 / 20,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  AspectRatio(
                    aspectRatio: 9 / 16,
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.fitHeight,
                      placeholder: "assets/images/cdt.jpg",
                      image:
                          "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR6X55YQ_Sb8VI4scS-7OSAwo5ln45jvFVqY9xEm-uiFi1DFlEI",
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
            for (var tab in tabs.skip(1))
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
    );
  }
}
