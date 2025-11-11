import 'package:flutter/material.dart';
import 'package:makc_app/global_widgets/custom_icon.dart';
import 'package:makc_app/modules/calendar/widgets/calendar_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  int selectedViewTab = 0; // 0: Month, 1: Week, 2: Day
  int selectedUserTab = 0; // 0: All, 1: Alimurat, 2: Michael
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();

  final List<String> userTabs = ['All', 'Alimurat', 'Michael'];
  final List<Color> userColors = [
    const Color(0xFFE3F2FD),
    const Color(0xFFFCE4EC),
    const Color(0xFFE8F5E9),
  ];
  final List<Color> userTextColors = [
    Colors.blue,
    Colors.pink,
    Colors.green,
  ];

  // Sample events (now using asset images)
  final Map<DateTime, List<Map<String, dynamic>>> events = {
    DateTime(2025, 11, 2): [
      {
        'title': 'Boxing Basics - Beginner',
        'time': '10:00 AM - 11:00 AM',
        'instructor': 'with James Garcia',
        'location': 'Al\'s Boxing',
        'image': 'assets/images/c1.png',
        'colors': [Colors.green, Colors.pink],
      },
      {
        'title': 'Yoga',
        'time': '12:00 AM - 13:00 AM',
        'instructor': 'with James Garcia',
        'location': 'Yoga Studio',
        'image': 'assets/images/c2.png',
        'colors': [Colors.pink],
      },
    ],
    DateTime(2025, 11, 3): [
      {
        'title': 'Yoga',
        'colors': [Colors.pink],
        'image': 'assets/images/c2.png',
      },
    ],
    DateTime(2025, 11, 6): [
      {
        'title': 'Event',
        'colors': [Colors.green],
        'image': 'assets/images/c2.png',
      },
    ],
    DateTime(2025, 11, 8): [
      {
        'title': 'Event',
        'colors': [Colors.pink],
        'image': 'assets/images/c1.png',
      },
    ],
    DateTime(2025, 11, 10): [
      {
        'title': 'Multi Event',
        'colors': [Colors.green, Colors.pink, Colors.blue],
        'image': 'assets/images/c1.png',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildUserFilterTabs(),
            const SizedBox(height: 16),
            _buildViewTabs(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (selectedViewTab == 0) _buildMonthView(),
                    if (selectedViewTab == 1) _buildWeekView(),
                    if (selectedViewTab == 2) _buildDayView(),
                    _buildEventsList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Calendar',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
              onTap: () {
                showAddEventBottomSheet(
                  context,
                  selectedUserTab: selectedUserTab,
                  userTabs: ['All', 'Alimurat', 'Michael'],
                  userColors: [
                    Colors.blue.shade50,
                    Colors.pink.shade50,
                    Colors.green.shade50,
                  ],
                  userTextColors: [
                    Colors.blue,
                    Colors.pink,
                    Colors.green,
                  ],
                );
              },
              child: CustomIcon(
                  title: 'assets/icons/c2.svg',
                  height: 28,
                  width: 28,
                  color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildUserFilterTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(userTabs.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () => setState(() => selectedUserTab = index),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: selectedUserTab == index
                      ? userColors[index]
                      : Colors.transparent,
                  border: Border.all(
                    color: selectedUserTab == index
                        ? userTextColors[index]
                        : Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 18,
                      color: userTextColors[index],
                    ),
                    const SizedBox(width: 6),
                    Text(
                      userTabs[index],
                      style: TextStyle(
                        color: userTextColors[index],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildViewTabs() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          _buildTabButton('Month', 0),
          _buildTabButton('Week', 1),
          _buildTabButton('Day', 2),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedViewTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: selectedViewTab == index ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            boxShadow: selectedViewTab == index
                ? [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                  ]
                : null,
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: selectedViewTab == index
                  ? FontWeight.bold
                  : FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMonthView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () {
                  setState(() {
                    focusedDay =
                        DateTime(focusedDay.year, focusedDay.month - 1);
                  });
                },
              ),
              Column(
                children: [
                  Text(
                    _getMonthName(focusedDay.month),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    focusedDay.year.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {
                  setState(() {
                    focusedDay =
                        DateTime(focusedDay.year, focusedDay.month + 1);
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          TableCalendar(
            firstDay: DateTime(2020),
            lastDay: DateTime(2030),
            focusedDay: focusedDay,
            selectedDayPredicate: (day) => isSameDay(selectedDay, day),
            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerVisible: false,
            daysOfWeekHeight: 40,
            onDaySelected: (selected, focused) {
              setState(() {
                selectedDay = selected;
                focusedDay = focused;
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blue.shade400,
                shape: BoxShape.circle,
              ),
              selectedDecoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              defaultTextStyle: const TextStyle(fontSize: 16),
              weekendTextStyle: const TextStyle(fontSize: 16),
              outsideTextStyle: TextStyle(color: Colors.grey.shade400),
            ),
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                final eventList = _getEventsForDay(date);
                if (eventList.isEmpty) return null;

                return Positioned(
                  bottom: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: eventList[0]['colors']
                        .take(3)
                        .map<Widget>((color) => Container(
                              width: 5,
                              height: 5,
                              margin: const EdgeInsets.symmetric(horizontal: 1),
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                              ),
                            ))
                        .toList(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekView() {
    DateTime startOfWeek =
        selectedDay.subtract(Duration(days: selectedDay.weekday - 1));

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(7, (index) {
              DateTime day = startOfWeek.add(Duration(days: index));
              bool isSelected = isSameDay(day, selectedDay);
              final eventList = _getEventsForDay(day);

              return GestureDetector(
                onTap: () => setState(() => selectedDay = day),
                child: Column(
                  children: [
                    Text(
                      ['Mo', 'Tu', 'Wed', 'Th', 'Fr', 'Sa', 'Su'][index],
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 45,
                      height: 55,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            day.day.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          if (eventList.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: eventList[0]['colors']
                                    .take(3)
                                    .map<Widget>((color) => Container(
                                          width: 4,
                                          height: 4,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 1),
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? Colors.white
                                                : color,
                                            shape: BoxShape.circle,
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildDayView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            'Today, ${_getMonthName(selectedDay.month)} ${selectedDay.day}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventsList() {
    final dayEvents = _getEventsForDay(selectedDay);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (selectedViewTab != 2)
            Text(
              '${_getDayName(selectedDay.weekday)}, ${_getMonthName(selectedDay.month)} ${selectedDay.day}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(height: 16),
          ...dayEvents.map((event) => _buildEventCard(event)).toList(),
        ],
      ),
    );
  }

  Widget _buildEventCard(Map<String, dynamic> event) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              event['image'] ?? 'assets/images/c1.png',
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
                Row(
                  children: [
                    ...event['colors'].map((color) => Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                          ),
                        )),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        event['title'] ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  event['time'] ?? '',
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  event['instructor'] ?? '',
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  event['location'] ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showAddEventBottomSheet(
    BuildContext context, {
    required int selectedUserTab,
    required List<String> userTabs,
    required List<Color> userColors,
    required List<Color> userTextColors,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) {
        return AddEventBottomSheet(
          selectedUserTab: selectedUserTab,
          userTabs: userTabs,
          userColors: userColors,
          userTextColors: userTextColors,
        );
      },
    );
  }

  List<Map<String, dynamic>> _getEventsForDay(DateTime day) {
    return events[DateTime(day.year, day.month, day.day)] ?? [];
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }

  String _getDayName(int weekday) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return days[weekday - 1];
  }
}
