import 'package:flutter/material.dart';

class PromoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final VoidCallback onClose;

  const PromoCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            // Top colored border/strip
            Container(
              height: 8,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.pink.shade200,
                    Colors.red.shade200,
                  ],
                ),
              ),
            ),
            // Main content
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      InkWell(
                        onTap: onClose,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          child: const Icon(
                            Icons.close,
                            size: 24,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PromoSection extends StatefulWidget {
  const PromoSection({Key? key}) : super(key: key);

  @override
  State<PromoSection> createState() => _PromoSectionState();
}

class _PromoSectionState extends State<PromoSection> {
  int currentCardIndex = 0;

  // List of 10 promo cards data
  final List<Map<String, String>> promoCards = [
    {
      'title': 'Promo • Local Yoga Studio',
      'subtitle': 'Get 10% off your next booking',
      'description':
          'Refer a friend and you\'ll both get 10% off your next booking.',
    },
    {
      'title': 'Promo • Fitness Center',
      'subtitle': 'Free 1 month membership',
      'description':
          'Join now and get your first month absolutely free with annual subscription.',
    },
    {
      'title': 'Promo • Spa & Wellness',
      'subtitle': '20% off massage packages',
      'description':
          'Book any massage package this month and save 20% on your treatment.',
    },
    {
      'title': 'Promo • Healthy Cafe',
      'subtitle': 'Buy 1 Get 1 Free',
      'description':
          'Purchase any smoothie and get a second one free this weekend only.',
    },
    {
      'title': 'Promo • Dance Studio',
      'subtitle': '3 free trial classes',
      'description':
          'New members get 3 complimentary classes to try any dance style.',
    },
    {
      'title': 'Promo • Meditation Center',
      'subtitle': '50% off first session',
      'description':
          'Experience peace and mindfulness with half-price introductory session.',
    },
    {
      'title': 'Promo • Personal Training',
      'subtitle': 'Free fitness assessment',
      'description':
          'Get a complete body composition analysis and workout plan for free.',
    },
    {
      'title': 'Promo • Pilates Studio',
      'subtitle': '25 off class packages',
      'description': 'Save 25 when you purchase a 10-class package this month.',
    },
    {
      'title': 'Promo • Nutrition Coaching',
      'subtitle': 'Free meal plan included',
      'description':
          'Sign up for coaching and receive a customized 30-day meal plan.',
    },
    {
      'title': 'Promo • Boxing Gym',
      'subtitle': '2 weeks unlimited access',
      'description':
          'Try unlimited classes for 2 weeks and see why members love us.',
    },
  ];

  void _closeCurrentCard() {
    setState(() {
      if (currentCardIndex < promoCards.length - 1) {
        currentCardIndex++;
      } else {
        // All cards closed, show message or reset
        currentCardIndex = -1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (currentCardIndex >= 0 && currentCardIndex < promoCards.length)
          PromoCard(
            title: promoCards[currentCardIndex]['title']!,
            subtitle: promoCards[currentCardIndex]['subtitle']!,
            description: promoCards[currentCardIndex]['description']!,
            onClose: _closeCurrentCard,
          )
        else if (currentCardIndex == -1)
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 64,
                    color: Colors.green.shade400,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'All promotions viewed!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'You\'ve seen all available offers',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

// Example usage in a full screen (optional)
class PromoScreen extends StatelessWidget {
  const PromoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Promotions'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: PromoSection(),
      ),
    );
  }
}
