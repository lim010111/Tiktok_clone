import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All activity'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        children: [
          Text(
            'New',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              width: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  width: 0.7,
                  color: Colors.grey.shade400,
                ),
              ),
              child: const Center(
                child: FaIcon(FontAwesomeIcons.bell),
              ),
            ),
            title: RichText(
              text: TextSpan(
                text: 'Account Updates: ',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                children: [
                  const TextSpan(
                    text: 'Upload longer videos',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  TextSpan(
                    text: ' 1h',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                    ),
                  )
                ],
              ),
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
