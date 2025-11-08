import 'package:flutter/material.dart';

class YourPlacesSection extends StatelessWidget {
  const YourPlacesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> places = [
      {
        'name': 'Al\'s Boxing',
        'image': 'https://images.unsplash.com/photo-1549719386-74dfcbf7dbed?w=400',
      },
      {
        'name': 'Culinary Creators',
        'image': 'https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=400',
      },
      {
        'name': 'Yoga Studio',
        'image': 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=400',
      },
      {
        'name': 'Art Gallery',
        'image': 'https://images.unsplash.com/photo-1460661419201-fd4cecdf8a8b?w=400',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Your places',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: places.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(places[index]['image']!),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 80,
                        child: Text(
                          places[index]['name']!,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
