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
        imageUrl: 'assets/images/p1.png',
        statusColor: Colors.green,
      ),
      Studio(
        name: 'Lingua Academy',
        type: 'Education',
        location: 'Leawood, Kansas',
        status: 'Closes soon',
        rating: 0,
        distance: '',
        imageUrl: 'assets/images/p2.png',
        statusColor: Colors.orange,
      ),
      Studio(
        name: 'Pure Pilates',
        type: 'Pilates studio',
        location: 'Prairie, Kansas',
        status: 'Closed',
        rating: 0,
        distance: '4 km',
        imageUrl: 'assets/images/p3.png',
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
                          builder: (context) =>
                              StudioDetailScreen(studio: studios[index]),
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
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.search,
              color: Colors.grey.shade400,
              size: 32,
            ),
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 24,
          ),
        ),
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
