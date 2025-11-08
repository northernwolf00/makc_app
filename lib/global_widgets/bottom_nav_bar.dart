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
  int selectedIndex = 1;

  bool isvisible = false;
  @override
  void dispose() {
    super.dispose();
  }

  final List<Widget> page = [
    HomeScreen(),
    CalendarScreen(),
    ExploreScreen(),
    MessagesScreen(),
    MoreScreen()
  ];

  @override
  void initState() {
    super.initState();
  }

  bool appbar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        child: Row(
          children: [
            Expanded(
              child: BottomNavbarButton(
                icon: false,
                index: 0,
                selectedIndex: selectedIndex,
                onTapp: () {
                  onTapp(0);
                },
              ),
            ),
            Expanded(
              child: BottomNavbarButton(
                icon: false,
                index: 1,
                selectedIndex: selectedIndex,
                onTapp: () {
                  onTapp(1);
                },
              ),
            ),
            Expanded(
              child: BottomNavbarButton(
                icon: false,
                index: 2,
                selectedIndex: selectedIndex,
                onTapp: () {
                  onTapp(2);
                },
              ),
            ),
            Expanded(
              child: BottomNavbarButton(
                icon: false,
                index: 3,
                selectedIndex: selectedIndex,
                onTapp: () {
                  onTapp(3);
                },
              ),
            ),
            Expanded(
              child: BottomNavbarButton(
                icon: false,
                index: 4,
                selectedIndex: selectedIndex,
                onTapp: () {
                  onTapp(4);
                },
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        // index: selectedIndex,
        children: [Center(child: page[selectedIndex])],
      ),
    );
  }

  void onTapp(int index) async {
    setState(() {
      selectedIndex = index;
    });
  }
}
