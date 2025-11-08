import 'dart:ui';

class Studio {
  final String name;
  final String type;
  final String location;
  final String status;
  final double rating;
  final String distance;
  final String imageUrl;
  final Color statusColor;

  Studio({
    required this.name,
    required this.type,
    required this.location,
    required this.status,
    required this.rating,
    required this.distance,
    required this.imageUrl,
    required this.statusColor,
  });
}

class ClassProgram {
  final String name;
  final String description;
  final String coach;
  final String coachImage;
  final String startTime;
  final String duration;
  final String image;

  ClassProgram({
    required this.name,
    required this.description,
    required this.coach,
    required this.coachImage,
    required this.startTime,
    required this.duration,
    required this.image,
  });
}