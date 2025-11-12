import 'package:flutter/material.dart';
import 'package:makc_app/global_widgets/bottom_nav_button.dart';
import 'package:makc_app/modules/calendar/views/calendar_view.dart';
import 'package:makc_app/modules/explore/views/explore_view.dart';
import 'package:makc_app/modules/home/views/home_view.dart';
import 'package:makc_app/modules/messages/views/messages_view.dart';
import 'package:makc_app/modules/more/views/more_view.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    CalendarScreen(),
    ExploreScreen(),
    MessagesScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 1,
            color: Colors.grey.shade300,
          ),
          SizedBox(
            height: 70,
            child: Row(
              children: List.generate(5, (index) {
                return Expanded(
                  child: BottomNavbarButton(
                    icon: false,
                    index: index,
                    selectedIndex: selectedIndex,
                    onTapp: () => onTap(index),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
