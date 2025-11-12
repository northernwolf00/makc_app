import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makc_app/global_widgets/custom_icon.dart';
import 'package:makc_app/modules/explore/model/studio.dart';
import 'package:makc_app/modules/explore/views/class_detail_view.dart';
import 'package:makc_app/modules/explore/widgets/class_card.dart';
import 'package:makc_app/modules/explore/widgets/class_info_bottom_sheet.dart';

class StudioDetailScreen extends StatefulWidget {
  final Studio studio;

  const StudioDetailScreen({Key? key, required this.studio}) : super(key: key);

  @override
  State<StudioDetailScreen> createState() => _StudioDetailScreenState();
}

class _StudioDetailScreenState extends State<StudioDetailScreen> {
  int selectedTab = 0; // 0: Main, 1: Classes, 2: Appointments, 3: Coaches
  int selectedBookingTab = 0; // 0: Upcoming, 1: Past

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            _buildStudioInfo(),
            _buildActionButtons(),
            _buildTabs(),
            Expanded(
              child: selectedTab == 0
                  ? _buildMainTab()
                  : selectedTab == 1
                      ? _buildClassesTab()
                      : const Center(child: Text('Coming soon')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade50,
            child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child:
                      Icon(Icons.arrow_back_ios, color: Colors.black, size: 18),
                ))),
          ),
          IconButton(
            icon: const Icon(
              Icons.info_outline,
              color: Colors.black,
              size: 28,
            ),
            onPressed: () => _showInfoBottomSheet(context),
          ),
        ],
      ),
    );
  }

  Widget _buildStudioInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              widget.studio.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.studio.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${widget.studio.type} ·${widget.studio.location}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    CustomIcon(
                        title: 'assets/icons/c1.svg',
                        height: 14,
                        width: 14,
                        color: widget.studio.statusColor),
                    const SizedBox(width: 4),
                    Text(
                      widget.studio.status,
                      style: TextStyle(
                        color: widget.studio.statusColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (widget.studio.rating > 0) ...[
                      const SizedBox(width: 12),
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        widget.studio.rating.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                    if (widget.studio.distance.isNotEmpty) ...[
                      const SizedBox(width: 12),
                      Icon(Icons.location_on, color: Colors.blue, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        widget.studio.distance,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: CustomIcon(
                  title: 'assets/icons/i2.svg',
                  height: 24,
                  width: 24,
                  color: Colors.black),
              label: const Text('Message'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: BorderSide(color: Colors.grey.shade300),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: CustomIcon(
                  title: 'assets/icons/i3.svg',
                  height: 24,
                  width: 24,
                  color: Colors.black),
              label: const Text('Refer & Earn'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: BorderSide(color: Colors.grey.shade300),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildTab('Main', 0),
            _buildTab('Classes', 1),
            _buildTab('Appointments', 2),
            _buildTab('Coaches', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    bool isSelected = selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildMainTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildBookingTabs(),
          const SizedBox(height: 24),
          SvgPicture.asset('assets/icons/i4.svg', height: 48),
          const SizedBox(height: 24),
          const Text(
            'No booking yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your booking with ALI\'S COMMUNITY will show up here',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              _showInfoBottomSheet(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text(
              'See the schedule',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingTabs() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => selectedBookingTab = 0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: selectedBookingTab == 0
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Upcoming',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: selectedBookingTab == 0
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => selectedBookingTab = 1),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: selectedBookingTab == 1
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Past',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: selectedBookingTab == 1
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClassesTab() {
    final classes = [
      ClassProgram(
        name: 'Beginner Boxing',
        description: 'Learn fundamentals and conditioning',
        coach: 'James Bond',
        coachImage: 'assets/images/p1.png',
        startTime: '10:00 AM',
        duration: '1 hour',
        image: 'assets/images/im4.png',
      ),
      ClassProgram(
        name: 'Youth Program',
        description: 'Learn fundamentals and conditioning',
        coach: 'James Bond',
        coachImage: 'assets/images/p2.png',
        startTime: '12:00 PM',
        duration: '1 hour',
        image: 'assets/images/im4.png',
      ),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildWeekCalendar(),
          const SizedBox(height: 24),
          ...classes.map(
            (classProgram) => ClassCard(
              classProgram: classProgram,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ClassDetailScreen(classProgram: classProgram),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekCalendar() {
    final days = ['Mo', 'Tu', 'Wed', 'Th', 'Fr', 'Sa', 'Su'];
    final dates = [18, 19, 20, 21, 22, 23, 24];
    final selectedIndex = 3;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) {
        bool isSelected = index == selectedIndex;
        return Column(
          children: [
            Text(
              days[index],
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 45,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                dates[index].toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  void _showInfoBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StudioInfoBottomSheet(studio: widget.studio),
    );
  }
}
