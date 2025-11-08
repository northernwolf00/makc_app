import 'package:flutter/material.dart';
import 'package:makc_app/modules/explore/model/studio.dart';
import 'package:makc_app/modules/explore/widgets/studio_card.dart';
import 'package:makc_app/modules/explore/views/studio_detail.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studios = [
      Studio(
        name: 'Al\'s Boxing',
        type: 'Boxing gym',
        location: 'Overland Park, Kansas',
        status: 'Open',
        rating: 4.8,
        distance: '2 km',
        imageUrl: 'https://images.unsplash.com/photo-1549719386-74dfcbf7dbed?w=400',
        statusColor: Colors.green,
      ),
      Studio(
        name: 'Lingua Academy',
        type: 'Education',
        location: 'Leawood, Kansas',
        status: 'Closes soon',
        rating: 0,
        distance: '',
        imageUrl: 'https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=400',
        statusColor: Colors.orange,
      ),
      Studio(
        name: 'Al\'s Boxing',
        type: 'Pilates studio',
        location: 'Prairie, Kansas',
        status: 'Closed',
        rating: 0,
        distance: '4 km',
        imageUrl: 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400',
        statusColor: Colors.red,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: studios.length,
                itemBuilder: (context, index) {
                  return StudioCard(
                    studio: studios[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudioDetailScreen(studio: studios[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey.shade400),
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}
